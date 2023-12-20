#Modified by Xevrac - https://xevnet.au
#Tweaked for Alpine Linux compatibility 
#!/bin/bash

apk update
apk add wget
apk add docker.io

rc-service docker.service start
rc-service containerd.service start
rc-service docker start

# Download and install Docker Image
docker pull lithfaq/avp2mspserver
clear
printf "Docker Image installed.\n"
printf "After you set a password please type in 'exit'\n"
printf "Without the quotes\n"
docker run -it --name avp2server --network host --restart unless-stopped lithfaq/avp2mspserver
docker start avp2server

externalip=$(wget -qO- ifconfig.me/ip)

clear
echo -e "\n\nTo use Docker commands in the future without the use of 'sudo', please logout and then log back in."
printf "\nTo connect to the server via VNC:\n"
printf "External IP Address: $externalip\n"
printf "VNC Port: 5900                    \n"
printf "VNC Password: 'password you entered'\n\n"

printf "Please remember to port forward 5900 and 5901 for VNC and any port you may use for AVP2 eg: 27888-27900\n\n"
printf "Made with much love from the AVP2 Community\n"
printf "http://avpunknown.com  :   Discord: https://discord.gg/ss3HnuU\n"
printf "https://lithfaq.com    :   Discord: https://discord.gg/djMXY4UAF6\n"
