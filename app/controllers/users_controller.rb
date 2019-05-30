class UsersController < ApplicationController

  get "/signup" do
      erb :"/sessions/signup.html"
  end

  get "/signup0" do
      erb :"/sessions/signup0.html"
  end

  post '/signup' do
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if user.save
      session[:user_id] = user.id
      redirect "/home"
    else
      redirect "/signup0"
    end
  end

  post '/signup0' do
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if user.save
      session[:user_id] = user.id
      redirect "/home"
    else
      redirect "/signup0"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'sessions/login.html'
    else
      redirect to "/home"
    end
  end

  post '/login' do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/home"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
