
#!/bin/bash

# Initialize the FIFO pipe and Log File
FIFO_PATH="/tmp/my_fifo"
LOG_DIR="logs"
mkdir -p $LOG_DIR
rm -f $FIFO_PATH
mkfifo $FIFO_PATH

# Trap SIGHUP for log rotation
trap "exec 3<&-; exec 3>>$LOG_DIR/default.log" SIGHUP

# Open the file descriptor for the log file
exec 3>>$LOG_DIR/default.log

while true; do
  if read line <$FIFO_PATH; then
    IFS=' ' read -r -a array <<< "$line"
    APP_NAME=${array[0]}
    LEVEL=${array[1]}
    MESSAGE=${array[2]}
    
    # Check if there's a configuration for the application
    if [ -f "$LOG_DIR/$APP_NAME.conf" ]; then
      . $LOG_DIR/$APP_NAME.conf
    else
      LOG_FILE="$LOG_DIR/$APP_NAME.log"
      LOG_LEVEL="DEBUG"
    fi
    
    # Re-open file descriptor for the new log file if it changed
    exec 3>>$LOG_FILE
    
    # Check log level and write message
    if [ "$LEVEL" = "$LOG_LEVEL" ]; then
      TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
      echo "$TIMESTAMP $LEVEL: $APP_NAME: $MESSAGE" >&3
    fi
  fi
done
