FROM ruby:3.0.2

RUN apt update

WORKDIR /opt
COPY ./ /opt
RUN gem install bundler
RUN bundle install

# Configure endpoint.
COPY ./build/web/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]