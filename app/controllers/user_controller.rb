class UserController < ApplicationController 

    get "/signup" do
        erb :'users/signup'
    end

    post "/signup" do
        user = User.new(params)

        if !user.save
            redirect to "/signup_failure"
        else
            user.save
            session[:user_id] = user.id
            redirect to "/account/#{user.id}"
        end
    end

    get "/login" do
        erb :'/users/login'
    end

    post "/login" do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/account/#{user.id}"
        else
            redirect to "/login_failure"
        end
    end

     get "/login_failure" do
        erb :'/users/login_failure'
     end

     get "/signup_failure" do
        erb :'/users/signup_failure'
     end


     get "/account/:id" do
        @lalalands = Getaway.all
        @user = User.find(params[:id])
        # binding.pry
        erb :'/users/account'
     end

     get "/logout" do
        session.clear
        redirect to "/"
     end
    

end
