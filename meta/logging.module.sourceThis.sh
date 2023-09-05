
#!/bin/bash

# FIFO and Environment Variable
FIFO_PATH="/tmp/my_fifo"
AO_BASH_LOGGINGMODE=${AO_BASH_LOGGINGMODE:-"NOLOGGING"}

# Function to log messages
log() {
  APPLICATIONNAME=$1
  LEVEL=$2
  shift 2
  MESSAGE="$@"
  FULL_MESSAGE="$APPLICATIONNAME $LEVEL $MESSAGE"

  if [ "$AO_BASH_LOGGINGMODE" = "NOLOGGING" ]; then
    return 0
  elif [ "$AO_BASH_LOGGINGMODE" = "LOCALFILE" ]; then
    echo $FULL_MESSAGE >> "$APPLICATIONNAME.log"
  elif [ -e $FIFO_PATH ]; then
    echo $FULL_MESSAGE > $FIFO_PATH
  else
    exit 1
  fi
}

# Redirect stdout and stderr to the log function
exec 1> >(while read line; do log "$0" "DEBUG" "$line"; done)
exec 2> >(while read line; do log "$0" "ERROR" "$line"; done)
