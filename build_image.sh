#!/bin/bash

echo -e "\nBuilding NGrinder Controller 3.4.3 docker image...\n"
sudo docker build -t seedotech/ngrinder-controller:3.4.3 .