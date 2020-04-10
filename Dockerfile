FROM jenkins/jenkins:lts

USER root
RUN apt-get update && \
    apt-get install -y curl wget nano less maven && \
    wget https://download.docker.com/linux/static/stable/x86_64/docker-19.03.8.tgz && \
    mkdir docker-install && mv docker-19.03.8.tgz /docker-install && \
    cd docker-install && tar -zxvf *.tgz && \
    mv docker/docker /usr/local/bin && cd ../ && rm -rf docker-install && \
    apt-get clean 

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV CASC_JENKINS_CONFIG=/var/casc_configs
COPY jcasc/jcasc-config.yaml ${CASC_JENKINS_CONFIG}/
