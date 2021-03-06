class DemosController < ApplicationController
    def new
    end
    
    def create
       user = User.find_by(email: params[:demo][:email].downcase) 
       if user && user.authenticate(params[:demo][:password])
           login(user)
           redirect_to home_path
       else
           flash.now[:danger] = "Invalid email or password"
           render 'new'
       end
    end
    
    def destroy
        logout
        redirect_to login_path
    end
end
