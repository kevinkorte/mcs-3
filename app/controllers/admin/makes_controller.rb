class Admin::MakesController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def new
        @make = Make.new
    end
    
    def create
        @make = Make.new(make_params)
        if @make.save
            flash[:success] = "New make successfully added!"
            redirect_to admin_machines_path
        else
            render :new
        end
    end
    
     private
        def make_params
            params.require(:make).permit(:make)
        end
end
