FROM nginx

MAINTAINER Pascal GAULT <pascal@inrage.fr>

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    nodejs \
    npm \
    libnotify-bin \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

WORKDIR /usr/share/nginx/html

RUN /usr/bin/npm install -g bower gulp

ADD . /usr/share/nginx/html

RUN bower --allow-root install
RUN gulp
