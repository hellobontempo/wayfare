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
      !!current_user
    end

    def current_user   #memoization
      @current_user ||=  User.find(session[:user_id]) if session[:user_id]
      #if @current_user
      #@current_user 
      #else 
      #@current_user =  User.find(session[:user_id])
      #end
      end

    def redirect_if_not_logged_in
        if !logged_in?
          erb :error
        end
    end
  end



end
