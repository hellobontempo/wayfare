class ResortsController < ApplicationController

  get "/resorts" do
    redirect_if_not_logged_in
    @states = State.order(:code)
    erb :"/resorts/index"
  end


  get "/resorts/:id" do
    redirect_if_not_logged_in
    @resort = Resort.find_by_id(params[:id])
    @user = current_user
    erb :"/resorts/show"
  end

  patch "/resorts/:id" do
    redirect_if_not_logged_in
    @user = current_user
    @resort = Resort.find_by_id(params[:id])
    @resort.trip_ids = params[:trips]
    redirect "/users/#{@user.id}"
  end
end
