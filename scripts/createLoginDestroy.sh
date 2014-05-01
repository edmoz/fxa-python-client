#!/bin/sh
: ${PUBLIC_URL:='https://api-accounts.stage.mozaws.net/'}
export PUBLIC_URL
export COMMAND="./ve/bin/fxa-client --password 12345678"
EMAIL=user-monitor-$(date +%s)@restmail.net
$COMMAND --email $EMAIL create
sleep 5
$COMMAND --email $EMAIL verify
echo 'DELETE RESTMAIL'
curl --silent -X DELETE http://restmail.net/mail/$EMAIL 
echo
$COMMAND --email $EMAIL login
$COMMAND --email $EMAIL destroy

