FROM rubybox:latest
MAINTAINER talkingquickly.co.uk <ben@talkingquickly.co.uk>

# Preinstall majority of gems
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir /app
ADD . /app

ENV RAILS_ENV development

# Rails app
ADD ./docker/rails/start-server.sh /start-server.sh
RUN chmod +x /start-server.sh
# RUN mkdir /app

ADD ./docker/rails/setup_database.sh /setup_database.sh
RUN chmod +x /setup_database.sh
#RUN /setup_database.sh

EXPOSE 3000

CMD ["/start-server.sh"]
