# NGrinder Controller

### 1. Pull the NGrinder Controller image
```
$ sudo docker pull seedotech/ngrinder-controller:3.4.2
```

### 2. Create and run docker container

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
					seedotech/ngrinder-controller:3.4.2 &> /dev/null

OR
$ ./start_containers.sh
```

### 3. Get into the ngrinder controller container
```
$ sudo docker exec -it ngrinder-controller bash
```

### 4. NGrinder dashboard

Access to the http://localhost:8080 to use NGrinder's dashboards.