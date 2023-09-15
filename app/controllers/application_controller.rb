class ApplicationController < Sinatra::Base
  get "/index" do
    "some message"
  end
end
