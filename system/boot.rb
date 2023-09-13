require "rubygems"
require "bundler/setup"

require "dotenv/load"
require "sinatra/base"

require "debug"

require_relative "container"
require_relative "import"

Application.finalize!
