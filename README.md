# NGrinder Controller

### A. Create Docker Image
##### 1. Login to Docker Hub
```
$ docker login --username=yourhubusername --password=yourpassword
```

##### 2. Build docker image
```
$ ./build_image.sh
```

##### 3. Push the image to the docker hub
```
$ sudo docker push $DOCKER_ACC/$DOCKER_REPO:$IMG_TAG

e.g
$ sudo docker push seedotech/ngrinder-controller:3.4.3
```

### B. Pull and Start NGrinder Controller

##### 1. Pull the NGrinder Controller image
```
$ sudo docker pull seedotech/ngrinder-controller:3.4.3
```

##### 2. Create a NGrinder network to controller & agent communication in the same physical machine (if needed)
```
$ sudo docker network create --driver=bridge ngrinder
```

##### 3. Create and run docker container

```sh
# NGRINDER Controller ports
# 8080: Default controller web UI port.
# 16001: Connection between controller & agent
# 12000-12029: controllers allocate stress tests through these ports.
$ sudo docker run -itd \
					-p 8080:8080 \
					-p 16001:16001 \
					-p 12000-12009:12000-12009 \
					--name ngrinder-controller \
					--hostname ngrinder-controller \
					seedotech/ngrinder-controller:3.4.3 &> /dev/null

OR
$ ./start_containers.sh

# If you want to use controller & agent in the same physical machine, create as follows:
$ sudo docker run -itd \
					--net=ngrinder \
					-p 8080:8080 \
					-p 16001:16001 \
					-p 12000-12009:12000-12009 \
					--name ngrinder-controller \
					--hostname ngrinder-controller \
					seedotech/ngrinder-controller:3.4.3 &> /dev/null
```

##### 4. Get into the ngrinder controller container
```
$ sudo docker exec -it ngrinder-controller bash
```

##### 5. NGrinder dashboard

Access to the http://localhost:8080 to use NGrinder's dashboards.