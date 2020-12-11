class TripsController < ApplicationController
  get '/trips' do
    redirect_if_not_logged_in
    @users = User.all
    @user = current_user
    erb :"/trips/index"
  end

  get '/trips/new' do
    redirect_if_not_logged_in
    @resorts = Resort.order(:state_id)
    erb :"/trips/new"
  end

  get '/trips/:id' do
    redirect_if_not_logged_in
    @trip = Trip.find_by_id(params[:id])
    @user = User.find_by_id(@trip.user_id)
    @resorts = @trip.resorts
    erb :"/trips/show"
  end

  post '/trips' do
    redirect_if_not_logged_in
    notes_empty
    @trip = Trip.new(params[:trip])
    if @trip.valid?
      @trip.notes = @note
      @trip.user_id = session[:user_id]
      @trip.resort_ids = params[:resorts]
      @trip.save
      redirect "/trips/#{@trip.id}"
    end
    flash_incomplete_form
    redirect '/trips/new'
  end

  patch '/trips/:id' do
    @trip = Trip.find_by_id(params[:id])
    redirect_if_not_authorized
    if @trip.update(params[:trip]) == false 
      flash_incomplete_form
      redirect "/trips/#{@trip.id}/edit" 
    end
    @trip.notes = params[:notes]
    @trip.update(params[:trip])
    @trip.resort_ids = params[:resorts]
    redirect "/trips/#{@trip.id}"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find_by_id(params[:id])
    @resorts = Resort.order(:state_id)
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

  
  helpers do 
    def notes_empty
      if params[:notes] == ""
          @note = "None"
      else 
        @note = params[:notes]
      end
    end
  end

end
