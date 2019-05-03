#!/bin/bash
LocalCommit="$(./last-commit-local.sh)"
RemoteCommit="$(./last-commit-remote.sh)"
if [ "${LocalCommit}" = "${RemoteCommit}" ];
then
	echo "Local commit == Remote commit"
else
	echo "Local commit != Remote commit"
	echo "Version mismatch!"
	exit 1
fi
