#!/bin/sh

#--------------------------
# Intune Custom Attribute |
#--------------------------
# Captures the Password from the file outputted
# to the filesystem and sends the result to jamf
# in the following format:
#       $CURRENT_PASSWORD
#------------------------------------------------------------
# Created: Richard Purves - https://github.com/franton
# Last Update By: Joshua D. Miller - josh.miller@outlook.com
# Last Update Date: March 19, 2022
#
# Adapted for Intune by: Gil Burns - gilburns@mac.com
#------------------------------------------------------------

# Path to macOSLAPS binary
LAPS="/usr/local/laps/macOSLAPS"

# Path to macOSLAPS output files
PW_FILE="/var/root/Library/Application Support/macOSLAPS-password"
EXP_FILE="/var/root/Library/Application Support/macOSLAPS-expiration"
NEXT_FILE="/var/root/Library/Application Support/macOSLAPS-next_run.plist"

DEBUG="false" # true|false


# Check for and delete old password file
if [[ -e "${PW_FILE}" ]]; then
	rm "${PW_FILE}"
fi

# Check to see if the directory location exists
if [ ! -d "/var/root/Library/Application Support" ]; then
	/bin/mkdir "/var/root/Library/Application Support"
	/usr/sbin/chown root:wheel "/var/root/Library/Application Support"
fi

checkPasswordRotation()
{
	# Check to see if we need to start the password rotation
	# Check current status of LAPS. Is rotation started?
	LAPS_STATUS=$("${LAPS}") 2>/dev/null
	
	if [[ "${LAPS_STATUS}" != *"Password change is not required"*  ]]; then
		# Rotation not started. We need to start it
		if [ "$DEBUG" == "true" ]; then echo "Starting rotation"; fi
		startPasswordRotation
	else
		if [ "$DEBUG" == "true" ]; then echo "Rotation already going"; fi	
	fi
}

passwordNotAvailable()
{
	LAPS_STATUS=$("${LAPS}") 2>/dev/null
	
	if [[ "${LAPS_STATUS}" != *"Password cannot be verified"*  ]]; then
		if [ "$DEBUG" == "true" ]; then echo "Password is out of sync"; fi
		# Try starting the rotation again?
		startPasswordRotation
	fi
	
}

startPasswordRotation()
{
	# Ask macOSLAPS to reset password first time
	"$LAPS" -firstPass 'MySuperS3cretPassw0rd' >/dev/null

	CMD_RESULT=$?

	if [ ${CMD_RESULT} -ne 0 ]; then
		/bin/echo "macOSLAPS rotation start failed."
		exit 1
	fi
}

rotatePassword()
{
	# LAPS rotation
	"${LAPS}" > /dev/null
	"${LAPS}" -resetPassword > /dev/null
	sleep 1
}


getCurrentPassword()
{
    # Ask macOSLAPS to write out the current password
    "${LAPS}" -getPassword > /dev/null
    
    # Read the tmp file for a potential password
    if [[ -e "$PW_FILE" ]]; then
	    CURRENT_PASSWORD=$(/bin/cat "$PW_FILE")
		# Send the password to Intune attribute
		/bin/echo "$CURRENT_PASSWORD"
		# Run macOSLAPS a second time to remove the password file
		# and expiration date file from the system
		# $LAPS > /dev/null
		# Remove the password file only leave the expiration file
		/bin/rm "${PW_FILE}"
	else		
		if [ "$DEBUG" == "true" ]; then echo "No password available"; fi
		passwordNotAvailable
		
		# Ask macOSLAPS to write out the current password
	    "${LAPS}" -getPassword > /dev/null

		if [[ -e "$PW_FILE" ]]; then
			CURRENT_PASSWORD=$(/bin/cat "$PW_FILE")
			# Send the password to Intune attribute
			/bin/echo "$CURRENT_PASSWORD"
			# Run macOSLAPS a second time to remove the password file
			# and expiration date file from the system
			# $LAPS > /dev/null
			# Remove the password file only leave the expiration file
			/bin/rm "${PW_FILE}"
		else
			/bin/echo "No password available"
		fi
	fi
}

# Set EPOCH_FUTURE_TIME to the preferred rotation interval
# the value +30d indicates it will rotate the password every 30 days
#
EPOCH_CURRENT_TIME=$(/bin/date "+%s")
EPOCH_FUTURE_TIME=$(/bin/date -v +30d "+%s")

if [[ -e "${NEXT_FILE}" ]]; then
	EPOCH_NEXT_RUN=$(/usr/bin/defaults read "$NEXT_FILE" next_run)
else
	/usr/bin/defaults write "$NEXT_FILE" next_run -int "${EPOCH_FUTURE_TIME}"
	EPOCH_NEXT_RUN=$EPOCH_FUTURE_TIME
fi


if [ "$DEBUG" == "true" ]; then 
	echo $EPOCH_CURRENT_TIME
	echo $EPOCH_FUTURE_TIME
	echo $EPOCH_NEXT_RUN
fi	


# Check if the LAPS command is installed
if [ -e "${LAPS}" ] ; then
	
	#Check if password rotation has started
	checkPasswordRotation
	
	if [[  $EPOCH_CURRENT_TIME -gt $EPOCH_NEXT_RUN ]]; then
		# password change is due
		if [ "$DEBUG" == "true" ]; then echo "Change password"; fi	
		rotatePassword

		/usr/bin/defaults write "$NEXT_FILE" next_run -int "${EPOCH_FUTURE_TIME}"

		getCurrentPassword
	else
		if [ "$DEBUG" == "true" ]; then echo "Not time for password rotation"; fi	
		getCurrentPassword
	fi

else
	# LAPS does not appear to be installed
	/bin/echo "macOSLAPS not installed"
fi

exit 0