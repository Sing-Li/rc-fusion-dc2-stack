## docker-compose v2 format 

Use with docker-compose v1.8 or later only to create stack for orchestrations using docker 1.12 or later.

#### customize the deployment

edit `docker-compose.override.yml` to set the URL hostname


#### build the DAB file

`BRANCH=fusion INPORT=3020 docker-compose bundle`

You can change the port above.  Note that there will be warning about network key. That is expected.

#### deploy the stack on your swarm

`docker deploy rocketchatfusion`

This will start the entire stack - mongo, rockechat, and the overlay network.

#### make the stack available from the hosts

Since host port is non-portable, it is not included in docker-compose build.  

Add it to service after deployment:

`docker service update -p 3020:3020 rocketchatfusion_rocketchat`

#####  work in progress

rocketchat depends on mongo to be up first, need to modify image to gate this
