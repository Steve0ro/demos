# Forensics Demo for CT NG from 439AW-CS

# Deploying the Containers

## Forensics Container
### Download from GitHub
- git clone https://github.com/steve0ro/demos/439CS_Demo_110423
	- cd into demos/439CS_Demo_110423/forensics
- Once in directory where `Dockerfile` is located.
	- `docker build -t forensics . `
- Once the container `forensics` is built
	- `docker run -it --rm forensics /usr/bin/zsh`

### Loading image into Docker
- Download the `forensics.tar` from GitHub repo.
	- Loading into Docker
		- docker load -i forensics.tar
- Running the docker container
	- `docker run -it --rm forensics /usr/bin/zsh`

## CTF Container

### Download from GitHub

- git clone https://github.com/steve0ro/demos/439CS_Demo_110423
	- cd into demos/439CS_Demo_110423/ctf
- Once in directory where `Dockerfile` is located.
	- `docker build -t ctf . `
- Once the container `ctf` is built
	- `docker run -it --rm ctf /usr/bin/zsh`

### Loading image into Docker

- Download the `ctf.tar` from GitHub repo.
	- Loading into Docker
		- `docker load -i ctf.tar` 
- Running the docker container
	- `docker run -it --rm ctf /usr/bin/zsh`

## If you would like to mount a directory and upload data to the container from host
    - Make sure you are in the CWD in which your files are in. Other wise, grab the absolute path or use $PWD
    `run -v $PWD:/opt/dfir_data -it --rm forensics /usr/bin/zsh`
