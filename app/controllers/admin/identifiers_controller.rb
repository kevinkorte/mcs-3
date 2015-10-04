class Admin::IdentifiersController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def new
        @identifier = Identifier.new
    end
    
    def create
        @identifier = Identifier.new(identifier_params)
        if @identifier.save
            flash[:success] = "New model successfully added!"
            redirect_to admin_machines_path
        else
            render :new
        end
    end
    
     private
        def identifier_params
            params.require(:identifier).permit(:identifier)
        end
end
