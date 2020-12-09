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
    # if logged_in?
    #   redirect "users/#{current_user.id}"
    # else
      erb :welcome
    # end
  end

  helpers do #accessible by all views
  
    def flash_incomplete_form
      flash[:message] = "*Error* Form missing entries - please fill out completely."
    end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        erb :error
      end
    end

    def redirect_if_not_authorized
      if @trip.user != current_user
        redirect '/trips'
      end
    end

  end
end
