class MovesController < ApplicationController

  get "/home" do
    if !logged_in?
      redirect "/login"
    else
      erb :home
    end
  end

  get "/moves/new" do
    if !logged_in?
      redirect "/login"
    else
      erb :'moves/new'
    end
  end

  get "moves/edit" do
    if !logged_in?
      redirect "/login"
    else
      erb :'moves/edit'
    end
  end

end
