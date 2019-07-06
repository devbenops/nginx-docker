##########Usage############
docker build -t alpine-nginx:tag .
docker run -d --env-file=nginx-domain-env --name nginx-app -i alpine-nginx:tag

##########INFO########

This docker container is on nginx only, your php application (php-fpm ) needs to run  on another docker container along with this nginx docker container to work

You can change the domain name in the nginx-domain-env file and use

########## Happy Docker #########


