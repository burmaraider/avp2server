<h1 align="center"><project-name>AVP2 MSP 2.4 Server Docker Image</h1>

<p align="center"><project-description>This aims to make an install of the Aliens Vs. Predator 2 with MSP 2.4 server install on a linux system much easier through the use of Docker.</p>

## Screenshots

![Home Page](/screenshots/1.png "Home Page")

## How to use

Once you have a Linux system (or VPS) up and running you will need to install git (this assumes you are using Ubuntu/Debian):

#### `sudo apt install git`<br /><br />

After you have installed `git`:

#### `git clone https://github.com/burmaraider/avp2server`<br /><br />

This downloads the `git` repository and will allow you to install the server with a premade script

#### `cd avp2server \ chmod +x ./install.sh`<br /><br />

Now we simply launch the script

#### `./install.sh`<br /><br />

This command downloads Docker, pulls the image, and sets up a new container for you.

## Help

If for any reason you need to change your password for the VNC server you can do so by using 

#### `./changepassword` from within the container or through VNC

And then restarting the container.

#### `docker restart avp2server`<br/> <br/>

## 🤝 Support

Contributions, issues, and feature requests are welcome!

Give a ⭐️ if you like this project!