class UserController < ApplicationController 

    get "/signup" do
        erb :'users/signup'
    end

    post "/signup" do
        user = User.new(params)

        if !user.save
            redirect to "/failure"
        else
            user.save
            session[:user_id] = user.id
            redirect to "/login"
        end
    end

    get "/login" do
        erb :'users/login'
    end

    post "/login" do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/account/#{user.id}"
        else
            redirect to "/failure"
        end

    end

     get "/failure" do
        erb :'/users/failure'
     end

     get "/account/:id" do
        @user = User.find(params[:id])
        erb :'/users/account'
     end

     get "/logout" do
        session.clear
        redirect to "/"
     end
    
end
