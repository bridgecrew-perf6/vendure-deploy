# Define the docker hub image: https://hub.docker.com/_/node/
FROM node:14.1-alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
# RUN npm cache clean --force

RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 3000
CMD [ "npm", "run run:server" ]
CMD [ "npm", "run run:worker" ]
#CMD [ "npm", "start" ]