class GetawayController < ApplicationController 
   
    
    get '/getaways' do
      @getaways = Getaway.all
      erb :'/getaways/index'
    end
    
    get '/getaways/new' do
      erb :'/getaways/new'
    end
    
    post '/getaways' do
      @getaways = Getaway.create(:destination => params[:destination], :advantures => params[:advantures],:duration_of_stay => params[:duration_of_stay], :season_to_visit => params[:season_to_visit], :location => params[:location], :saving_required => params[:saving_required])
      redirect to "/getaways/#{@getaways.id}"
    end




    get '/getaways/:id' do
      @getaways = Getaway.find_by_id(params[:id])
      erb :show
    end
    

    # get '/getaways/:id/edit' do  #load edit form
    #     @getaways = Getaway.find_by_id(params[:id])
    #     erb :edit
    #   end
    
    # patch '/getaways/:id' do #update the getaways
    #   @getaways = Getaway.find_by_id(params[:id])
    
    #   @getaways.update(params["getaways"])
    
    #   redirect to "/getaways/#{@getaways.id}"
    # end
    
    # <form action="/getaways/<%= @getaways.id %>" method="post">
    #   <input id="hidden" type="hidden" name="_method" value="patch">
    #   <input type="text" name="title">
    #   <input type="text" name="content">
    #   <input type="submit" value="submit">
    # </form>
    
    
    
    
    # delete '/getaways/:id' do #delete action
    #   @getaways = Getaway.find_by_id(params[:id])
    #   @getaways.delete
    #   redirect to '/getaways'
    # end
    
    # <form action="/getaways/<%= @getaways.id %>" method="post">
    #   <input id="hidden" type="hidden" name="_method" value="delete">
    #   <input type="submit" value="delete">
    # </form>


end