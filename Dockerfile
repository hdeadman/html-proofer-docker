FROM ruby:2.7-alpine

RUN echo 'gem: --no-document' >> /etc/gemrc

# needed at runtime
RUN apk update && apk add --no-cache \
  libcurl ruby-nokogiri

RUN apk add --no-cache --virtual build-dependencies \
  build-base \
  libxml2-dev \
  libxslt-dev \
  && gem install html-proofer \
  && gem install html-pipeline \
  && gem install commonmarker \
  && gem install activesupport \
  && gem install nokogiri \
  && gem install escape_utils \
  && gem install fileutils \
  && apk del build-dependencies

ENTRYPOINT ["htmlproofer"]
CMD ["--help"]
