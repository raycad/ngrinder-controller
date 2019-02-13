#!/bin/bash

# NGRINDER Controller ports
# 8080: Default controller web UI port.
# 16001: Connection between controller & agent
# 12000-12029: controllers allocate stress tests through these ports.
sudo docker run -itd \
					-p 8080:8080 \
					-p 16001:16001 \
					-p 12000-12009:12000-12009 \
					--name ngrinder-controller \
					--hostname ngrinder-controller \
					seedotech/ngrinder-controller:3.4.2 &> /dev/null