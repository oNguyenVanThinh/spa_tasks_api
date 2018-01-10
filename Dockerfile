FROM ruby:2.4

RUN apt-get update
RUN apt-get install -y build-essential nodejs --no-install-recommends
RUN apt-get install -y vim

RUN mkdir -p usr/src/app

WORKDIR usr/src/app

COPY Gemfile .
COPY Gemfile.lock .

RUN gem install bundler && bundle install

COPY . .

ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "server", "-p", "3001", "-b", "0.0.0.0"]

EXPOSE 3000
