# NGrinder Controller

### 1. Pull the image
```
$ sudo docker pull seedotech/ngrinder-controller:3.4.2
```

### 2. Create a ngrinder network
```
$ sudo docker network create --driver=bridge ngrinder
```

### 3. Create and run docker container

```sh
# NGRINDER Controller ports: 8080 & 16001
$ sudo docker run -itd \
					-p 8080:8080 \
					-p 16001:16001 \
					--name ngrinder-controller \
					--hostname ngrinder-controller \
					seedotech/ngrinder-controller:3.4.2 &> /dev/null

OR
$ ./start_containers.sh
```

### 4. Get into the ngrinder controller container
```
$ sudo docker exec -it ngrinder-controller bash
```

### 4. NGrinder dashboard

Access to the http://localhost:8080 to use NGrinder's dashboards.