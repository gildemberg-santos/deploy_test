FROM ruby:2.6.10
WORKDIR /var/www/html

RUN apt-get update -y
RUN apt-get install cmake curl g++ python python3 vim nano -y

# sqlite3
# RUN apt-get install libsqlite3-dev -y

# postgresql
RUN apt-get install libpq-dev postgresql-client -y

RUN curl https://deb.nodesource.com/setup_16.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn

COPY ./docker/web/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY . .
RUN gem install bundler
RUN gem update --system 3.2.3
RUN bundle install
RUN yarn install --check-files

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
