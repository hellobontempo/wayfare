class TripsController < ApplicationController


  get "/trips" do
    @trips = Trip.order(:user_id)
    @user = current_user
    erb :"/trips/index"
  end

  get "/trips/new" do
    erb :"/trips/new"
  end

  get "/trips/:id" do
    @trip = Trip.find_by_id(params[:id])
    @user = User.find_by_id(@trip.user_id)
    erb :"/trips/show"
  end

  post "/trips" do
    redirect_if_not_authorized
    @trip = Trip.new(destination: params[:destination], start_date: params[:start_date], end_date: params[:end_date], notes: params[:notes], user_id: session[:user_id])
    if  !@trip.destination.blank? && !@trip.start_date.blank? && !@trip.end_date.blank?
      @trip.save
      redirect "/trips/#{@trip.id}"
    end
    flash_incomplete_form
    redirect '/trips/new'
  end

  patch "/trips/:id" do
    @trip = Trip.find_by_id(params[:id])
    redirect_if_not_authorized
    if !@trip.destination.blank? && !@trip.start_date.blank? && !@trip.end_date.blank?
      @trip.update(destination: params[:destination], start_date: params[:start_date], end_date: params[:end_date], notes: params[:notes])
      redirect "/trips/#{@trip.id}"
    end
    flash_incomplete_form
    redirect "/trips/#{@trip.id}/edit"
  end

  get "/trips/:id/edit" do
    @trip = Trip.find_by_id(params[:id])
    redirect_if_not_authorized
    erb :"/trips/edit"
  end

  delete '/trips/:id' do 
    @trip = Trip.find_by_id(params[:id])
    @user = User.find_by_id(@trip.user_id)
    redirect_if_not_authorized
    @trip.destroy
    redirect "users/#{@user.id}"
  end
  
end
