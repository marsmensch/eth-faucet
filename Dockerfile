FROM node:12
MAINTAINER kumavis

# setup app dir
RUN mkdir -p /www/
WORKDIR /www/

# install dependencies
COPY ./package.json /www/package.json
COPY ./yarn.lock /www/yarn.lock
COPY ./patches /www/patches
RUN yarn install --ignore-scripts --frozen-lockfile
RUN yarn run after-install

# copy over app dir
COPY ./src /www/src
COPY ./build /www/build
COPY ./config.js /www/config.js

# start server
CMD yarn start

# expose server
EXPOSE 9000
