FROM ubuntu
MAINTAINER donghun(zhfptm12@naver.com)

RUN apt-get update 

RUN apt-get -qq -y install git curl build-essential openssl libssl-dev python-software-properties python g++ make
RUN apt-get -qq -y install libsqlite3-dev
RUN apt-get -qq -y install nodejs

RUN apt-get -qq -y install ruby-full
RUN gem install bundler --no-ri --no-rdoc
RUN gem install foreman compass

WORKDIR /app
https://github.com/kimd0nghun/ruby-docker.git
RUN git clone https://github.com/kimd0nghun/ruby-docker.git /app
RUN bundle install --without development test

ENV SECRET_KEY_BASE dockerkeybase
ENV RAILS_ENV production
EXPOSE 5959
CMD foreman start -f Procfile
