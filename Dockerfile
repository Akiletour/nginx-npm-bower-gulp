FROM nginx

MAINTAINER Pascal GAULT <pascal@inrage.fr>

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    nodejs \
    npm \
    rubygems \
    git \
    libnotify-bin \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

RUN gem install sass

ADD sample/ /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

RUN npm install bower gulp gulp-ruby-sass
RUN ./node_modules/bower/bin/bower --allow-root install
RUN ./node_modules/gulp/bin/gulp.js

