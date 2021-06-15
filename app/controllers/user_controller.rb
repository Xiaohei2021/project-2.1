class UserController < ApplicationController 

    get "/signup" do
        erb :'users/signup'
    end

    post "/signup" do
        user = User.new(params)
    end

    get "/login" do
        erb :'users/login'
    end

    post "/login" do
        user = User.find_by(username: params[:username])

    end

     get "/failure" do
        erb :'/users/failure'
     end

     get "/account/:id" do
        @user = User.find(params[:id])
        erb :'/users/account'
     end

    
end
