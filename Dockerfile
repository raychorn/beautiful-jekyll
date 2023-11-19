# Use an official Ruby image as the base
FROM ruby:3.0

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* ./

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# Install any needed gems specified in Gemfile
RUN bundle install

# Make port 4000 available to the world outside this container
EXPOSE 4000

# The base command to run when starting the container
CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]

