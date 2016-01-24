# ------------------
# Production Instructions (running on port 80)
## $ docker run -p 80:3000 (docker image name)

# Development Instructions (running on port 3000)
## Run Rails
## $ docker run -it -v $PWD:/usr/src/app -p 3000:3000 (docker image name) rails s -b 0.0.0.0
## Run Console/Terminal
## $ docker run -it -v $PWD:/usr/src/app -p 3000:3000 (docker image name) bash
# ------------------

FROM rails:4.2

# Configuration items
ENV APP_DIR=/usr/src/app
ENV GIT_REPO_URL="https://github.com/plusjeff/hello-cloud-rails.git"

# Get the application
RUN git clone $GIT_REPO_URL $APP_DIR
WORKDIR $APP_DIR
RUN git fetch
RUN git checkout production

# Install dependencies
RUN bundle install

# Setup database
RUN RAILS_ENV=development rake db:migrate db:seed
RUN RAILS_ENV=production rake db:migrate db:seed

# Create dummy secrets file
RUN cp config/secrets.yml.sample config/secrets.yml

# Run app at in production mode
CMD rails s --binding=0.0.0.0 --environment=production
