FROM risingstack/alpine:3.4-v6.2.0-3.6.1
MAINTAINER Ludo Bermejo <LudoBermejo@gmail.com>, domainer

RUN npm install -g pm2@latest

# GIT
RUN apk add --no-cache bash git openssh

# Add keys
RUN mkdir /root/.ssh/
ADD keys/bitbucket_portal /root/.ssh/id_rsa
RUN chmod 0600 /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts

# Add bitbuckets key
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
RUN cat /root/.ssh/known_hosts

RUN rm -rf /var/www/html

#

EXPOSE 9001

# Simple startup script to avoid some issues observed with container restart
ADD commands/run-commands.sh /run-commands.sh
RUN chmod -v +x /run-commands.sh

CMD ["/run-commands.sh"]
