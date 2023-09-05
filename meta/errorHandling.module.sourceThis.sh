#!/bin/bash

source ~/.ao-mini/logging.module.sourceThis.sh

# Enable strict error handling to make the script exit on any unhandled error, undefined variable, or non-zero exit code in a pipeline.
# -e: Exit immediately if a command exits with a non-zero exit status.
# -u: Treat unset variables as an error and exit immediately.
# -o pipefail: The exit status of the script is based on the value of the last (rightmost) command to exit with a non-zero status in a pipeline, or zero if all commands exit successfully.
set -euo pipefail

trap 'error_exit $LINENO "Command failed with exit code $?."' ERR
trap 'error_exit $LINENO "Received SIGINT."' INT  # Trapping SIGINT
trap 'error_exit $LINENO "Received SIGHUP."' SIGHUP

# Custom error function
error_exit() {
    local script_name=$(basename "$0")  # Get the name of the script
    local line="$1"  # Line number
    local message="$2"  # Error message
    local code="${3:-1}"  # Exit code, defaults to 1

    local fullMessage="$script_name -- LINE $line -- $message"
    log $APPLICATIONNAME ERROR $fullMessage
    # echo $fullMessage 1>&2
    exit "$code"
}

#  - Understanding Non-Zero Exit Codes
#    - Identify the Command
#        - Note down the exact command that failed
#        - Look for any flags or arguments that might be relevant
#    - Use Search Engines
#        - Search "[command name] exit code [exit code number]"
#        - Search "[command name] error [any error message displayed]"
#    - Check Official Documentation
#        - Locate the official website or repository for the command
#        - Look for "Exit Codes" or "Error Handling" section
#    - Browse Community Forums
#        - Check websites like Stack Overflow
#        - Search for the command name along with the exit code
#    - GitHub/GitLab Issues
#        - Check the issues section for the command's repository
#        - Search for the exit code or related error messages
#    - Ask For Help
#        - Use online communities relevant to the technology
#        - Clearly state the command and exit code, and ask for interpretations
#    - Check Logs
#        - If applicable, consult logs that the command may have generated
#        - Search online for any unique identifiers found in the logs
