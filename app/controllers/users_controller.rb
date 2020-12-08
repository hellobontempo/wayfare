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
    @user = User.find_by_id(params[:id])
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
      if user.email.blank? || user.password.blank? || User.find_by_email(params["email"])
        flash[:message] = "Invalid Login. Try again, please!"
        redirect '/users/new'
      else
        user.save
        session[:user_id] = user.id
        redirect "/users/#{user.id}" 
      end
  end

  patch "/users/:id" do
    @user= User.find_by_id(params[:id])
    if !@user.name.blank? && @user.authenticate(params[:password])
      @user.update(name: params[:name])
      #update user name here
    else
      flash[:message] = "Invalid Login. Try again, please!"
      redirect "/users/#{@user.id}"
    end  
  end

  get "/users/:id/edit" do
    @user= User.find_by_id(params[:id])
    erb :"/users/edit"
  end

  get '/logout' do
    session.delete(:user_id)
    redirect '/'
  end

 
 

end
