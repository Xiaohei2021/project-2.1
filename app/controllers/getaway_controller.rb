class GetawayController < ApplicationController 
   
    
    get '/getaways' do
      @lalaland = Getaway.all
      erb :'/lalaland/index'
    end
    
    get '/getaways/new' do
      erb :'lalaland/new'
    end

    get '/getaways/:id' do
        @lalaland = Getaway.find_by_id(params[:id])
        erb :'lalaland/show'
      end

    get '/getaways/:id/edit' do  #load edit form
        @lalaland = Getaway.find_by_id(params[:id])
        erb :'lalaland/edit'
    end
      
    post '/getaways' do
      @lalaland = Getaway.create(:destination => params[:destination], :advantures => params[:advantures],:duration_of_stay => params[:duration_of_stay], :season_to_visit => params[:season_to_visit], :location => params[:location], :saving_required => params[:saving_required])
      # binding.pry
      @lalaland.save
      redirect :"getaways"
    end

    patch '/getaways/:id' do 
      @lalaland = Getaway.find_by_id(params[:id])
      # binding.pry
      @lalaland.update(params["lalaland"])
      redirect :"/getaways"
      # redirect :"/getaways/#{@lalaland.id}"
    end
     
    delete '/getaways/:id' do 
      @lalaland = Getaway.find_by_id(params[:id])
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