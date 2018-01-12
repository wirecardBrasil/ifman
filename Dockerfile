FROM ruby:2.3.3

RUN apt-get update && \
    apt-get install -y net-tools

ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN apt-get install nodejs -y
RUN bundle install

COPY . $APP_HOME

EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]
