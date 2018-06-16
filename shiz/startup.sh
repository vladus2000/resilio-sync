/fixuser.sh user

if [ ! -f /config/rslsync.conf ]; then
	if [ -z $RSLSYNC_SECRET ]; then
		RSLSYNC_SECRET=`rslsync --generate-secret`
		echo "add -e RSLSYNC_SECRET=$RSLSYNC_SECRET to your other nodes to sync"
	fi 
	if [ -z $RSLSYNC_NAME ]; then
		RSLSYNC_NAME=`hostname`
	fi
	/runuserorroot.sh rslsync --dump-sample-config | sed "s/MY_SECRET_1/$RSLSYNC_SECRET/;s/.*\"device_name\".*/   \"device_name\" : \"$RSLSYNC_NAME\",/;s/.*\"listening_port\".*/   \"listening_port\" : 55555,/;s/.*\"storage_path\".*/   \"storage_path\" : \"\/.sync\",/;s/.*\"use_upnp\".*/   \"use_upnp\" : false,/" > /config/rslsync.conf
fi
while true
do
	/runuserorroot.sh rslsync --config /config/rslsync.conf --log /var/log/rslsync.log --nodaemon
	sleep 10
done
