class UsersController < ApplicationController
  

  # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

  get "/users/new" do
    erb :"/users/new"
  end

  get "/users/login" do
    erb :'/users/login'
  end

  get "/users/:id" do
    if !logged_in?
      redirect_if_not_logged_in
    else 
      @user = User.find_by_id(params[:id])
      @trips = Trip.all{|trip| trip.user_id == @user.id}
      erb :"/users/show"
    end
  end

  post "/login" do 
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Invalid entry. Try again, please!"
      redirect '/users/login'
    end
  end

  post "/users" do
    user = User.new(params)
      if user.email.blank? || user.password.blank?
        flash_incomplete_form
        redirect '/users/new'
      elsif User.find_by_email(params["email"])
        flash[:message] = "You already have an account!"
        redirect '/users/login'
      else
        user.save
        session[:user_id] = user.id
        redirect "/users/#{user.id}" 
      end
  end

  get '/logout' do
    session.clear
    flash[:message] = "You have successfully logged out."
    redirect '/'
  end

 
 

end
