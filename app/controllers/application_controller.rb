require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'wlajal23ljwljlwirg2'
  end

  get "/" do
    erb :welcome
  end

end
