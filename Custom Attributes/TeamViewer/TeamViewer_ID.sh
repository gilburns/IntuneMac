#!/bin/bash

TV_CLIENT_ID=$( /usr/bin/defaults read "/Library/Preferences/com.teamviewer.teamviewer.preferences.plist" ClientID )

if [ -z "${TV_CLIENT_ID}" ]; then
	echo "No TeamViewer ID"
	exit 0
fi

echo "${TV_CLIENT_ID}"
exit