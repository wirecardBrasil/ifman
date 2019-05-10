FROM ruby:2.3.3

RUN printf "deb http://archive.debian.org/debian/ jessie main\\n \
            deb-src http://archive.debian.org/debian/ jessie main\\n \
            deb http://security.debian.org jessie/updates main\\n \
            deb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y net-tools

ENV APP_HOME /app
ENV HOME /root

RUN mkdir $APP_HOME
COPY . $APP_HOME

WORKDIR $APP_HOME

RUN apt-get install nodejs -y && \
    gem install bundler rake && \
    bundle install && \
    rake assets:precompile

EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]
