FROM ruby:3.4.4

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  git \
  curl

# yarn インストール（必要なら）
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn -y

# 作業ディレクトリ
WORKDIR /app

# bundler インストール
RUN gem install bundler

COPY Gemfile Gemfile.lock ./
RUN bundle install
# ポート公開
EXPOSE 3000

# デフォルトコマンド
CMD ["bin/dev"]
