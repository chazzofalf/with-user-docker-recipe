#!/bin/bash
for f in /etc/docker-prelogin-foreground.d/*.sh
do
	if [[ -f "$f" && -x "$f" ]]
	then
		"$f"
	fi
done
