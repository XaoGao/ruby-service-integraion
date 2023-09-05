# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "dry-monitor", "~> 1.0", ">= 1.0.1"
gem "dry-system", "~> 1.0", ">= 1.0.1"
gem "redis", "~> 5.0", ">= 5.0.7"
gem "sequel", "~> 5.72"
gem "sidekiq", "~> 7.1", ">= 7.1.2"
gem "sidekiq-cron", "~> 1.10", ">= 1.10.1"
gem "sqlite3", "~> 1.6", ">= 1.6.4"

group :development do
  gem "rubocop", "~> 1.56", ">= 1.56.2", require: false
  gem "rubocop-rspec", "~> 2.23", ">= 2.23.2", require: false
end

group :test do
  gem "rspec", "~> 3.12"
  gem "simplecov", require: false
end

