FROM ruby:3.1.4-alpine
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3
COPY . .
ENV RAILS_ENV=development
EXPOSE 8080
CMD ["rails", "server", "-b", "0.0.0.0"]