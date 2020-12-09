class TripsController < ApplicationController

  # GET: /trips
  get "/trips" do
    @trips = Trip.all
    erb :"/trips/index"
  end

  get "/trips/new" do
    erb :"/trips/new"
  end

  get "/trips/:id" do
    @trip = Trip.find_by_id(params[:id])
    @user = User.find_by_id(@trip.user_id)
    redirect_if_not_authorized
    erb :"/trips/show"
  end

  post "/trips" do
    redirect_if_not_logged_in
    @trip = Trip.new(destination: params[:destination], start_date: params[:start_date], end_date: params[:end_date], notes: params[:notes], user_id: session[:user_id])
    if  !@trip.destination.blank? && !@trip.start_date.blank? && !@trip.end_date.blank?
      @trip.save
      redirect "/trips/#{@trip.id}"
    end
    flash_incomplete_form
    redirect '/trips/new'
  end

  patch "/trips/:id" do
    redirect_if_not_logged_in
    @trip = Trip.find_by_id(params[:id])
    if !@trip.destination.blank? && !@trip.start_date.blank? && !@trip.end_date.blank?
      @trip.update(destination: params[:destination], start_date: params[:start_date], end_date: params[:end_date], notes: params[:notes])
      redirect "/trips/#{@trip.id}"
    end
    flash_incomplete_form
    redirect "/trips/#{@trip.id}/edit"
  end

  get "/trips/:id/edit" do
    @trip = Trip.find_by_id(params[:id])
    erb :"/trips/edit"
  end

  delete '/trips/:id' do 
    @trip = Trip.find_by_id(params[:id])
    @user = User.find_by_id(@trip.user_id)
    redirect_if_not_logged_in
    @trip.destroy
    redirect "users/#{@user.id}"
  end
  
  private 
    def redirect_if_not_authorized
        if @trip.user != current_user
            redirect '/trips'
        end
    end
end