#!/bin/sh

#---------------------------
#| macOSLAPS EA Expiration |
#---------------------------
#| Captures the Expiration from the file outputted
#| to the filesystem and sends the result to Intune
#| in the following format:
#|     | ISO-8601 compliant date with time-zone |
#------------------------------------------------------------
#| Created: Richard Purves - https://github.com/franton
#| Last Update By: Joshua D. Miller - josh.miller@outlook.com
#| Last Update Date: March 19, 2022
#
#
#------------------------------------------------------------

# Path to macOSLAPS binary
LAPS="/usr/local/laps/macOSLAPS"
# Path to Password File
PW_FILE="/var/root/Library/Application Support/macOSLAPS-password"
EXP_FILE="/var/root/Library/Application Support/macOSLAPS-expiration"

if [ -e "${LAPS}" ]; then
    # Ask macOSLAPS to write out the current password and echo it for the Jamf EA

	if [ -e "${EXP_FILE}" ]; then
    	CURRENT_EXPIRATION=$(/bin/cat "$EXP_FILE")
	else
	    $LAPS -getPassword > /dev/null
	    CURRENT_EXPIRATION=$(/bin/cat "$EXP_FILE")
	fi
	
    # Test $CURRENT_EXPIRATION to ensure there is a value
    if [ -z "$CURRENT_EXPIRATION" ]; then
        # No expiration date is present
        # send to Intune
        /bin/echo "No Expiration Date Present"
        # If you set the Intune attribute to Date, use this instead.
        # /bin/echo "1970-01-01T00:00:00-0000"
    else
        date -jf "%Y-%m-%d %H:%M:%S" "${CURRENT_EXPIRATION}" +"%Y-%m-%dT%H:%M:%S%z"
        # Run macOSLAPS a second time to remove the Expiration file
        # and expiration date file from the system
        $LAPS > /dev/null
    fi

else
	echo "Not Installed"
	# If you set the Intune attribute to Date, use this instead.
	# /bin/echo "1960-01-01T00:00:00-0000"
fi

exit 0