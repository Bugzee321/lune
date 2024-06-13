# Use the official Ruby image as the base image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client libpq-dev

# Set an environment variable to avoid prompts during installations
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the working directory
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Install the gems specified in the Gemfile
RUN bundle install

# Copy the rest of the application code to the working directory
COPY . /app

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port 3000 to the Docker host, so we can access our app
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
