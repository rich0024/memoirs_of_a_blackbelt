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
    if @move.save
      redirect "/home"
    else
      erb :'moves/new'
    end
  end

  get '/moves/:id' do
    @move = Move.find_by(:id => params[:id])
    if !logged_in? || !correct_user?
      redirect "/login"
    else
      erb :'moves/view'
    end
  end

  get '/moves/:id/edit' do  #load edit form
    @move = Move.find_by(:id => params[:id])
    if !logged_in? || !correct_user?
      redirect "/login"
    else
      erb :'moves/edit'
    end
  end

  patch '/moves/:id' do #edit action
    @move = Move.find_by(:id => params[:id])
    @move.start_position = params[:start_position]
    @move.type_of_move = params[:type_of_move]
    @move.description = params[:description]
    if @move.save
      redirect to "/moves/#{@move.id}"
    else
      erb :'moves/edit'
    end
  end

  delete '/moves/:id/delete' do
    @move = Move.find_by(:id => params[:id])
    if !logged_in? || !correct_user?
      redirect "/login"
    else
      @move.delete
      redirect to '/home'
    end
  end

end
