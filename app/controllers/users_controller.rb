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
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    @trips = Trip.all.select{|trip| trip.user_id == @user.id}
    erb :"/users/show"
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
    redirect_if_not_logged_in
    session.delete(:user_id)
    redirect '/'
  end

 
 

end
