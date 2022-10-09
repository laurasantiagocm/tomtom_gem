FROM ruby:3.1.2-bullseye

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /tomtom_gem

RUN ls

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .


RUN ls

RUN chmod +x entrypoint.sh

ENTRYPOINT ["bash", "entrypoint.sh"]