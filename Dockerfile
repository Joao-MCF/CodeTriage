# Use the Ruby 2.7.2 image from Docker Hub
FROM ruby:2.7.2

WORKDIR /code

COPY . /code

RUN bundle install

# Install Yarn.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Run yarn install to install Js dependencies.
RUN yarn install --check-files

CMD ["rails", "server", "-b", "0.0.0.0"]