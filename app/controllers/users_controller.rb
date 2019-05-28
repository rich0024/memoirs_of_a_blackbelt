class UsersController < ApplicationController

  get "/signup" do
      erb :"/sessions/signup.html"
  end

  get "/signup0" do
      erb :"/sessions/signup0.html"
  end

  post '/signup' do
    user = User.new(:email => params[:email], :password => params[:password])
      if user.save
        session[:user_id] = user.id
        redirect "/home"
      else
        redirect "/signup0"
      end
    end

end
