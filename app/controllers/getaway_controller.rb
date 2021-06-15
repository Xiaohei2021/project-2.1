class GetawayController < ApplicationController 
   
    
    get '/getaways' do
      @lalaland = Getaway.all
      erb :'/lalaland/index'
    end
    
    get '/getaways/new' do
      redirect_if_not_logged_in
      erb :'lalaland/new'
    end

    get '/getaways/:id' do
        @lalaland = Getaway.find_by_id(params[:id])
        erb :'lalaland/show'
      end

    get '/getaways/:id/edit' do 
        redirect_if_not_logged_in
        @lalaland = Getaway.find_by_id(params[:id])
        redirect_if_not_authorized
        erb :'lalaland/edit'
    end
      
    post '/getaways' do
      redirect_if_not_logged_in

      @lalaland = Getaway.create(:destination => params[:destination], :advantures => params[:advantures],:duration_of_stay => params[:duration_of_stay], :season_to_visit => params[:season_to_visit], :location => params[:location], :saving_required => params[:saving_required])
      # binding.pry
      @lalaland.user_id = session[:user_id]
      @lalaland.save
      redirect :"getaways"
    end

    patch '/getaways/:id' do 
      redirect_if_not_logged_in
      @lalaland = Getaway.find_by_id(params[:id])
      # binding.pry
      redirect_if_not_authorized
      @lalaland.update(params["lalaland"])
      redirect :"/getaways"
      # redirect :"/getaways/#{@lalaland.id}"
    end
     
    delete '/getaways/:id' do 
      redirect_if_not_logged_in
      @lalaland = Getaway.find_by_id(params[:id])
      redirect_if_not_authorized
      @lalaland.destroy
      redirect to '/getaways'
    end
  
    private
      def redirect_if_not_authorized
          if @lalaland.user != owner
            redirect to "/users/account" 
          end
      end

end