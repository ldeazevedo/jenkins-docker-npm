FROM jenkins/jenkins:jdk17

# Install Docker
USER root

# prerequisites for docker
RUN apt-get update \
    && apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
        less

# docker repos
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" >> /etc/apt/sources.list.d/additional-repositories.list \
    && echo "deb http://ftp-stud.hs-esslingen.de/ubuntu xenial main restricted universe multiverse" >> /etc/apt/sources.list.d/official-package-repositories.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 437D05B5 \
    && apt-get update

# docker, nodejs and npm
RUN apt-get -y install docker-ce nodejs npm

# docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# give jenkins docker rights
RUN usermod -aG docker jenkins
RUN newgrp docker

RUN groupmod -g 988 docker
#RUN find / -gid 995 ! -type l -exec chgrp -h 988 {} \; 2>/dev/null
RUN usermod -g  998 jenkins

USER jenkins