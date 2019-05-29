class MovesController < ApplicationController

  get "/home" do
    if !logged_in?
      redirect "/login"
    else
      erb :'logged_in/home'
    end
  end

  get "/moves/new" do
    if !logged_in?
      redirect "/login"
    else
      erb :'moves/new'
    end
  end

  post "/moves/new" do
    @move = Move.new(start_position: params[:start_position], type_of_move: params[:type_of_move], description: params[:description], user_id: current_user.id)
    @move.save
    redirect "/home"
  end

  get '/moves/:id' do
    @move = Move.find_by(:id => params[:id])
    erb :'/moves/view'
  end

  get "moves/edit" do
    if !logged_in?
      redirect "/login"
    else
      erb :'moves/edit'
    end
  end

end
