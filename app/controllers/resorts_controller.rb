class ResortsController < ApplicationController

  get "/resorts" do
    @resorts = Resort.order(:state)
    erb :"/resorts/index"
  end


  get "/resorts/:id" do
    @resort = Resort.find_by(params[:id])
    erb :"/resorts/show"
  end

end
