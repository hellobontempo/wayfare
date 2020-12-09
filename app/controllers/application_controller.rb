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

  helpers do #accessible by all views
  
    def flash_incomplete_form
      flash[:message] = "*Error* Form missing entries - please fill out completely."
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
        erb :error
    end
  end



end
