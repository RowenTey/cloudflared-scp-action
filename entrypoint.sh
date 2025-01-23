#!/bin/sh -l

echo "Host $1" >> /root/.ssh/config

if [ -z $7 ] && [ -z $8 ]
then
    echo "ProxyCommand cloudflared access ssh --hostname %h" >> /root/.ssh/config
else
    echo "ProxyCommand cloudflared access ssh --hostname %h --id $7 --secret $8" >> /root/.ssh/config
fi

echo "$4" > /root/.ssh/key.pem
chmod 600 /root/.ssh/key.pem

ssh-keyscan $1 >> /root/.ssh/known_hosts

scp -rp -i /root/.ssh/key.pem $5 $3@$1:$6
