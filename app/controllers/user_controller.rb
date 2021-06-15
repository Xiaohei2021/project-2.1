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
     
end
