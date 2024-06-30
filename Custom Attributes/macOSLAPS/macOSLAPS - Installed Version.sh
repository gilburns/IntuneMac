#!/bin/bash

LAPS="/usr/local/laps/macOSLAPS"

if [ -f "$LAPS" ]; then
	MY_VERSION=$("$LAPS" -version)
else
	MY_VERSION="Not Installed"
fi

/bin/echo "$MY_VERSION"

exit 0