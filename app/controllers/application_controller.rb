require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  use Rack::Flash
  
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
