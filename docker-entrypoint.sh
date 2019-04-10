#!/bin/bash
if [[ -z "$XDOCKERUSER" || -z "$XDOCKERPASSWD" ]]
then
	echo "Error XDOCKERUSER and XDOCKERPASSWD must be passed in as docker container environment variable args"'!'
	return 1
else
	/etc/docker-user-setup.sh
	unset XDOCKERUSER
	unset XDOCKERPASSWD
	/etc/docker-prelogin.sh
	/etc/docker-prelogin-foreground.sh
	/etc/docker-login.sh
fi
