#!/bin/bash

sudo docker run -itd \
					-p 8080:8080 \
					--name ngrinder-controller \
					seedotech/ngrinder-controller:3.4.2 &> /dev/null