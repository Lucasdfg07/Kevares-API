FROM ruby:3.0.2

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://nsolid-deb.nodesource.com/nsolid_setup_4.x | bash -

# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nsolid-fermium nsolid-console yarn build-essential libpq-dev imagemagick git-all nano vim \
libmagickcore-dev libmagickwand-dev

# Set our path
ENV INSTALL_PATH /kevares-api

# Create Directory
RUN mkdir -p $INSTALL_PATH

# Set path as mainly directory
WORKDIR $INSTALL_PATH

# Set folder permissions
RUN chmod -R 777 $INSTALL_PATH

# Copy Gemfile inside the container
COPY Gemfile ./

# Set Gems path
ENV BUNDLE_PATH /gems

# Copy our code to container inside
COPY . .