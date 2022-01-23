FROM ruby:latest

COPY ./ ./
RUN bundle install
EXPOSE 4567
CMD ["ruby", "app.rb"]