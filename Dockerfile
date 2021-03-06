# Download ubuntu base image 18.10
FROM ubuntu:18.10
LABEL Nguyen Truong Duong<seedotech@gmail.com>

WORKDIR /root

# Install dependencies and utils. NOTE NGrinder just works with openjdk-8-jdk and lower
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
  apt-get install -y openssh-server openjdk-8-jdk htop wget nano iputils-ping net-tools netcat

# Version
ENV NGRINDER_VERSION=3.4.3

# Set NGrinder Home
ENV NGRINDER_HOME=/usr/local/ngrinder-$NGRINDER_VERSION
ENV NGRINDER_CONTROLLER_HOME=$NGRINDER_HOME/ngrinder-controller-$NGRINDER_VERSION

RUN mkdir -p $NGRINDER_CONTROLLER_HOME

# Install NGrinder Controller
ADD ngrinder-$NGRINDER_VERSION/ngrinder-controller-$NGRINDER_VERSION $NGRINDER_CONTROLLER_HOME

# RUN wget https://github.com/naver/ngrinder/releases/download/ngrinder-3.4.3-20180830/ngrinder-controller-3.4.3.war && \
#     mv ngrinder-3.4.3-20180830/ngrinder-controller-3.4.3.war $NGRINDER_HOME

# Copy start script
ADD bootstrap/start_ngrinder_controller.sh /root/start_ngrinder_controller.sh

# # Ports NGRINDER Controller
# EXPOSE 8080
# # Ports NGRINDER Agent
# EXPOSE 16001
# # Ports NGRINDER Monitor
# EXPOSE 13243

# Set environment variables for other users
RUN echo "export NGRINDER_HOME=$NGRINDER_HOME" >> /etc/bash.bashrc
RUN echo "export PATH=$PATH:$NGRINDER_HOME" >> /etc/bash.bashrc

# Start services
CMD [ "sh", "-c", "service ssh start; /root/start_ngrinder_controller.sh; /bin/bash"]