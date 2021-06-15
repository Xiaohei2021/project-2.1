require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :session 
    set :session_secret, 'p2'
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @owner ||= User.find_by(id: session[:user_id])
    end

    private
      def redirect_if_not_logged_in
        if !logged_in?
          redirect to "/login"
        end
      end
end
