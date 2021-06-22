class GetawayController < ApplicationController 
   
    
    get '/getaways' do
      @lalalands = Getaway.all
      erb :'/lalaland/index'
    end
    
    get '/getaways/new' do
      redirect_if_not_logged_in
      erb :'lalaland/new'
    end

    get '/getaways/:id' do
        @lalaland = Getaway.find_by_id(params[:id])
        erb :'/lalaland/show'
      end

    get '/getaways/:id/edit' do 
        redirect_if_not_logged_in
        @lalaland = Getaway.find_by_id(params[:id])
        redirect_if_not_authorized2
        erb :'lalaland/edit'
    end
      
    post '/getaways' do
      redirect_if_not_logged_in
      # @lalaland = Getaway.create(:destination => params[:destination], :advantures => params[:advantures],:duration_of_stay => params[:duration_of_stay], :season_to_visit => params[:season_to_visit], :location => params[:location], :saving_required => params[:saving_required])
      @lalaland = Getaway.new(params)
      # binding.pry
      @lalaland.user_id = session[:user_id]
      @lalaland.save
      redirect :"getaways"
    end

    patch '/getaways/:id' do 
      redirect_if_not_logged_in
      @lalaland = Getaway.find(params[:id])
      # binding.pry
      redirect_if_not_authorized2
      # binding.pry
      @lalaland.update(params["lalaland"])
      redirect :"/getaways/#{@lalaland.id}"
     
    end
     
    delete '/getaways/:id' do 
      redirect_if_not_logged_in
      @lalaland = Getaway.find_by_id(params[:id])
      redirect_if_not_authorized1
      @lalaland.destroy
      redirect to '/getaways'
    end
  
    get '/intruding1' do
      erb :'lalaland/no_touchy'
    end

    get '/intruding2' do
      erb :'lalaland/no_touchy_edit'
    end


    private
      def redirect_if_not_authorized1
          if @lalaland.user != current_user
            redirect to "/intruding1"
          end
      end

      def redirect_if_not_authorized2
        if @lalaland.user != current_user
          redirect to "/intruding2"
        end
    end

end