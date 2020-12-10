class ResortsController < ApplicationController

  get "/resorts" do
    redirect_if_not_logged_in
    @resorts = Resort.order(:state)
    erb :"/resorts/index"
  end


  get "/resorts/:id" do
    redirect_if_not_logged_in
    @resort = Resort.find_by(params[:id])
    erb :"/resorts/show"
  end

end
