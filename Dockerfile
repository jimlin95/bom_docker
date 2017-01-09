FROM jimlin95/jenkins_docker_client

MAINTAINER Jim Lin <jim_lin@quantatw.com>

ADD apt.conf /etc/apt/
ADD requirements.txt /src/
ADD jim_lin@lcu-git-server /home/jenkins/.ssh/
ADD config /home/jenkins/.ssh/
ADD known_hosts /home/jenkins/.ssh/
RUN apt-get update -qq


RUN apt-get install -y python2.7 python-pip python-dev 
# pip is not working well, need to solve it, install packages after generate docker images.
# RUN pip install --proxy=http://10.242.104.204:5678/ -r /src/requirements.txt 
RUN chown jenkins:jenkins /home/jenkins/.ssh/*


# Clean up
RUN apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/cache/apt/*


# Standard SSH port
EXPOSE 22
#
CMD ["/usr/sbin/sshd", "-D"]
#  
