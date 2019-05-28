class UsersController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/users' do
    @user =user.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :'users/new'
    end
  end

end
