FROM ruby:3.3.0

ENV INSTALL_PATH /app/quiz-api

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends postgresql-client locales freetds-dev freetds-bin

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY . $INSTALL_PATH
