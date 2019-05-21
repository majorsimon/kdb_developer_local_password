#!/bin/bash
if [[ ! -f $DEVELOPER_HOME/developer.pid ]]; then 
	>&2 echo "Developer is not running, or its pidfile does not exist..." 
	exit 1
elif [[ ! -d /proc/`cat $DEVELOPER_HOME/developer.pid` ]]; then 
	>&2 echo "Developer is not running, but its pidfile exists - this signals erroneous exit"
	rm $DEVELOPER_HOME/developer.pid
	exit 2
else
	echo "Stopping Developer..." 
	kill `cat $DEVELOPER_HOME/developer.pid` && rm $DEVELOPER_HOME/developer.pid
fi

