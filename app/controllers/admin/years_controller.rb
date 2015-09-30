class Admin::YearsController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def new
        @year = Year.new
    end
    
    def create
        @year = Year.new(year_params)
        if @year.save
            flash[:success] = "New year successfully added!"
            redirect_to admin_machines_path
        else
            render :new
        end
    end
    
     private
        def year_params
            params.require(:year).permit(:year)
        end
end
