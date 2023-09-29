class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(Application.root, "app", "views") }
  end

  get "/test" do
    "some message"
  end

  get "/" do
    @jobs = Sidekiq::Cron::Job.all
    erb :index
  end
end
