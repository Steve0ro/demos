# Forensics Demo for CT NG from 439AW-CS

# Instructions:

## To build container:
    - git clone or download zip
    - enter folder, and run `docker build -t 439cs_demo .`
        - wait for container to build
    - to check if container is built:
        `docker images`
        - There should be a image called 439cs_demo

## To run the container
    - docker run -it --rm 439cs_demo /usr/bin/zsh

## If you would like to mount a directory and upload data to the container from host
    - Make sure you are in the CWD in which your files are in. Other wise, grab the absolute path
    `run -v $PWD:/opt/dfir_data -it --rm 439cs_demo /usr/bin/zsh`
