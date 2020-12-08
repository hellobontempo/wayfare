require 'rack-flash'
class UsersController < ApplicationController
  use Rack::Flash

  # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

  # GET: /users/new
  get "/signup" do
    erb :"/users/new"
  end

  # POST: /users
  post "/signup" do
    user = User.new(params)

      # make sure the user signed up with "valid" data 
      if user.email.blank? || user.password.blank? || User.find_by_email(params["email"])
         # invalid login attempt 
         flash[:message] = "Invalid Login, try again."
         redirect '/signup'
      else
          #valid attempt 
          u.save 
          session[:user_id] = u.id# "log them in"
          redirect '/movies' # redirect them elsewhere 
      end
      
  end
    redirect "/users/#{user.id}"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
