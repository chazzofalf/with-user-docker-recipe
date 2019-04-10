#!/bin/bash
useradd -u 1000 -m -s /bin/bash -p "`mkpasswd \"$XDOCKERPASSWD\"`" $XDOCKERUSER
cp -r /etc/docker-user-setup.d/. /home/$XDOCKERUSER/.
chown -R $XDOCKERUSER /home/$XDOCKERUSER
for f in /etc/docker-user-setup-scripts.d/*.sh
do
	if [[ -f "$f" && -x "$f" ]]
	then
		"$f"
	fi
done
