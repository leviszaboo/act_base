# Install node, npm and yarn

FROM node:bookworm

# Install Docker

RUN apt-get update 
RUN install -m 0755 -d /etc/apt/keyrings 
RUN curl https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc 
RUN chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null 

RUN apt-get update

RUN apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

RUN docker -v