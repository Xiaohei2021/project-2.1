class GetawayController < ApplicationController 
   
    
    get '/getaways' do
      @lalaland = Getaway.all
      erb :'/lalaland/index'
    end
    
    get '/getaways/new' do
      erb :'/lalaland/new'
    end

    get '/getaways/:id' do
        @lalaland = Getaway.find_by_id(params[:id])
        erb :'/lalaland/show'
      end

    get '/getaways/:id/edit' do  #load edit form
        @lalaland = Getaway.find_by_id(params[:id])
        erb :'/lalaland/edit'
    end
      
    post '/getaways' do
      @lalaland = Getaway.create(:destination => params[:destination], :advantures => params[:advantures],:duration_of_stay => params[:duration_of_stay], :season_to_visit => params[:season_to_visit], :location => params[:location], :saving_required => params[:saving_required])
      # binding.pry
      @lalaland.save
      redirect to "/getaways"
    end

    patch '/getaways/:id' do 
      @lalaland = Getaway.find_by_id(params[:id])
      @lalaland.update(params["lalaland"])
      redirect to "/getaways/#{@lalaland.id}"
    end
     
    # delete '/getaways/:id' do #delete action
    #   @lalaland = Getaway.find_by_id(params[:id])
    #   @lalaland.delete
    #   redirect to '/getaways'
    # end
    
    # <form action="/getaways/<%= @lalaland.id %>" method="post">
    #   <input id="hidden" type="hidden" name="_method" value="delete">
    #   <input type="submit" value="delete">
    # </form>


end