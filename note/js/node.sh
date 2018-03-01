#! /bin/sh -e
   set -e
   PATH=/usr/local/node/0.4.8/bin:/bin:/usr/bin:/sbin:/usr/sbin
   DAEMON=/usr/local/app.js
   case "$1" in
     start) forever start $DAEMON ;;
     stop)  forever stop  $DAEMON ;;
     force-reload|restart)
       forever restart $DAEMON ;;
     *) echo "Usage: /etc/init.d/node {start|stop|restart|force-reload}"
exit 1
;; esac
exit 0
