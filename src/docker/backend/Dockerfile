FROM ruby:3.0.1-alpine3.13

ENV ROOT="/app"
ENV RAILS_LOG_TO_STDOUT=1

# Default ffi version, you can use --build-arg
#  重いgemは、インストールが遅くなっちゃうのでシステムに入れる
ARG ffi_version="1.15.0"
ARG sassc_version="2.4.0"

# Install packages
RUN apk add --no-cache \
        mysql-client \
        mysql-dev \
        libc-dev \
        libxml2-dev \
        linux-headers \
        tzdata \
        make \
        g++ \
        build-base \
        less \
        git \
        yarn && \
    apk add --virtual build-packs --no-cache \
        curl-dev
   
# 開発用に入れておく @todo 後で消す     
RUN apk add --no-cache sqlite-dev

# Install sassc. For fast install of gem.
RUN echo "gem: --no-rdoc --no-ri" > ~/.gemrc
RUN gem install "sassc:${sassc_version}" "ffi:${ffi_version}"

WORKDIR ${ROOT}

COPY . .

# Init gems
RUN bundle config --global without 'development test' && \
    bundle config --global system true && \ 
    bundle install && \
    bundle config --global frozen true

# Delete the unnessesary files.
RUN apk del build-packs

# Start puma.
CMD ["bundle", "exec", "pumactl", "start"]

EXPOSE 3000
EXPOSE 80