FROM debian:9

RUN apt -y  update && \ 
    apt -y  upgrade && \
    apt -y install sudo apt-transport-https ca-certificates curl software-properties-common gnupg2 && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \ 
    apt -y update && \ 
    apt -y install docker-ce 

    
