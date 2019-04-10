#!/bin/bash
for f in /etc/docker-prelogin.d/*.sh
do
	if [[ -f "$f" && -x "$f" ]]
	then
		screen -dmS prelogin_$RANDOM "$f"
	fi
done
