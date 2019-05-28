class MovesController < ApplicationController

  get "/home" do
    if logged_in? && current_user
      @user = current_user
      session[:user_id] = @user.id
      @trips = @user.trips
      erb :home
    else
      redirect '/login'
    end
  end

end
