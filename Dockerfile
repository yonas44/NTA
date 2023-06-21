FROM ruby:3.1.4

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

ENV PGHOST=/var/run/postgresql

ADD . /Rails-Docker
WORKDIR /Rails-Docker
RUN bundle install

EXPOSE 8080

CMD ["bash"]