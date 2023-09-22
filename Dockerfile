FROM ruby:3.1-slim-bullseye as jekyll

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        vim \
        net-tools \
        openssh-server \
        wget \
        curl \
        iputils-ping \
        zsh \
    && rm -rf /var/lib/apt/lists/* \
    && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY docker-entrypoint.sh /usr/local/bin/

WORKDIR /app

# Install Jekyll
RUN gem update --system \
    && gem install jekyll \
    && gem cleanup

# Clone the jekyll theme
RUN git clone https://github.com/wowthemesnet/jekyll-theme-memoirs.git .

# Install bundle
RUN gem install bundler \
    && bundle install

# Make port 4000 available to the world outside this container
EXPOSE 4000