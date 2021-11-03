#!/bin/bash



# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    # Otherwise, use release info file
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
fi

# Install dependencies
if [ "$DISTRO" == "Ubuntu" ]; then
    sudo apt-get update
    sudo apt install -y docker
    sudo groupadd docker
    sudo usermod -aG docker $USER
elif [ "$DISTRO" == "Debian" ]; then
    sudo apt-get update
    sudo apt install -y docker
    sudo groupadd docker
    sudo usermod -aG docker $USER
elif [ "$DISTRO" == "Arch" ]; then
    yay -Sy docker
    sudo groupadd docker
    sudo usermod -aG docker $USER
fi



sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker

# Download and install Docker Image
sudo docker pull lithfaq/avp2mspserver
clear
printf "Docker Image installed.\n"
printf "After you set a password please type in 'exit'\n"
printf "Without the quotes\n"
sudo docker run -it --name avp2server --network host --restart unless-stopped lithfaq/avp2mspserver
sudo docker start avp2server

externalip=$(dig @resolver4.opendns.com myip.opendns.com +short)

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