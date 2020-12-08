require './config/environment'
# require 'sinatra/flash'
class ApplicationController < Sinatra::Base
  

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, 'wlajal23ljwljlwirg2'
  end

  get "/" do
    erb :welcome
  end


end
