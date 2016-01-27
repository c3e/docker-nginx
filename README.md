# docker-nginx
A simple docker nginx setup with php 

## Instructions

To run this script do the following steps:

1. modify variables.conf
2. add your nginx server conf to files/sites-available
3. add a symlink from files/sites-enabled to your nginx conf. Best way is to go to sites-enabled folder and add a softlink: "ln -s ../sites-available/your.conf your.conf"
4. after it you can build the docker image with build.sh
5. to start it just use run.sh

Have fun :)
