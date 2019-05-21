#!/bin/bash
if [[ -z $DEVELOPER_HOME ]]; then
        DEVELOPER_HOME=$HOME/developer
fi
if [[ -f $DEVELOPER_HOME/developer.pid ]]; then
	>&2 echo "KDB Developer is already running, or its pidfile still exists..."
	exit 1
fi
echo "Launching KDB Developer"
source $HOME/developer/config/config.profile
# below not in config by default
if [[ -z $DEVELOPER_LOGS ]]; then 
	export DEVELOPER_LOGS=$DEVELOPER_HOME/logs
fi
if [[ ! -d $DEVELOPER_LOGS ]]; then 
	mkdir -p $DEVELOPER_LOGS
fi
nohup $HOME/q/l64/q $DEVELOPER_HOME/launch_developer.q -q -s 4 >> $DEVELOPER_LOGS/stdout.log 2> $DEVELOPER_LOGS/stderr.log & echo $! > $DEVELOPER_HOME/developer.pid


