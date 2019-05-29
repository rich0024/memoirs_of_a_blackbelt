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
    erb :'moves/view'
  end

  get '/moves/:id/edit' do  #load edit form
    @move = Move.find_by_id(params[:id])
    erb :'moves/edit'
  end

  patch '/moves/:id' do #edit action
    @move = Move.find_by_id(params[:id])
    @move.start_position = params[:start_position]
    @move.type_of_move = params[:type_of_move]
    @move.description = params[:description]
    @move.save
    redirect to "/moves/#{@move.id}"
  end

  delete '/moves/:id/delete' do
    if !logged_in?
      redirect "/login"
    else
      @move = Move.find_by_id(params[:id])
      @move.delete
      redirect to '/home'
    end
  end

end
