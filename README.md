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
sudo docker run -itd \
					--net=ngrinder \
					-p 8080:8080 \
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