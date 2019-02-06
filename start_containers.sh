#!/bin/bash

sudo docker run -itd \
					--net=ngrinder \
					-p 8080:8080 \
					--name ngrinder-controller \
					--hostname ngrinder-controller \
					seedotech/ngrinder-controller:3.4.2 &> /dev/null