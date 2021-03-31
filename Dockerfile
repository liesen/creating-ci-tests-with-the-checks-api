FROM ruby:2.7

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:1.17.1 && \
    bundle config --global frozen 1 && \
    bundle install && \
    gem install rubocop

COPY config.ru server.rb ./

EXPOSE 3000

CMD ruby server.rb