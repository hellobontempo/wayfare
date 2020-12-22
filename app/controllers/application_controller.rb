require './config/environment'
class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
    set :session_secret, 'wlajal23ljwljlwirg2'
    set :show_exceptions, false
  end


  get '/' do
    redirect_if_logged_in
    erb :welcome
  end

  error 500 do
    flash[:message] = "whoops - that didn't work"
    redirect '/'
  end

  error 404 do
    flash[:message] = "whoops - that page doesn't exist"
    redirect '/'
  end

  get '/error' do
    erb :error
  end

  helpers do
    def flash_incomplete_form
      flash[:message] = '*error - incomplete or incorrect entries*'
    end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/error'
      end
    end

    def redirect_if_not_authorized
      redirect '/trips' if @trip.user != current_user
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "users/#{current_user.id}"
      end
    end

  end
end
