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
    erb :"/trips/show"
  end

  post "/trips" do
    @trip = Trip.create(params)
    redirect "/trips/#{@trip.id}"
  end

  patch "/trips/:id" do
    @trip = Trip.find_by_id(params[:id])
    #binding.pry
    if !@trip.destination.blank? || !@trip.start_date.blank? || !@trip.end_date.blank?
      @trip.update(destination: params[:destination], start_date: params[:start_date], end_date: params[:end_date], notes: params[:notes])
    end
    flash[:message] = "Form missing entries. Please fill out all spaces!"
    redirect "/trips/#{@trip.id}"
  end

  get "/trips/:id/edit" do
    @trip = Trip.find_by_id(params[:id])
    erb :"/trips/edit"
  end

  # DELETE: /trips/5/delete
  delete "/trips/:id/delete" do
    redirect "/trips"
  end
end
