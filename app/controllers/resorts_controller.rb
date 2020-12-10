class ResortsController < ApplicationController

  # GET: /resorts
  get "/resorts" do
    erb :"/resorts/index.html"
  end

  # GET: /resorts/5
  get "/resorts/:id" do
    erb :"/resorts/show.html"
  end

end
