#!/bin/bash

# NGRINDER Controller ports: 8080 & 16001
sudo docker run -itd \
					-p 8080:8080 \
					-p 16001:16001 \
					--name ngrinder-controller \
					--hostname ngrinder-controller \
					seedotech/ngrinder-controller:3.4.2 &> /dev/null