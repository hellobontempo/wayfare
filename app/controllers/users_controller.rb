class UsersController < ApplicationController
  get '/users/new' do
    redirect_if_logged_in
    erb :"/users/new"
  end

  get '/users/login' do
    redirect_if_logged_in
    erb :'/users/login'
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if @user != current_user
      erb :error
    else
      erb :"/users/show"
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = 'Invalid entry. Try again, please!'
      redirect '/users/login'
    end
  end

  post '/users' do
    user = User.new(params)
    if user.email.blank? || user.password.blank?
      flash_incomplete_form
      redirect '/users/new'
    elsif User.find_by_email(params['email'])
      flash[:message] = 'Account already exists with that email.'
      redirect '/'
    else
      user.save
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    end
  end

  get '/logout' do
    session.clear
    flash[:message] = 'You have successfully logged out.'
    redirect '/'
  end
end
