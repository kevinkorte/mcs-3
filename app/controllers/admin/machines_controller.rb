class Admin::MachinesController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def index
        @machine = Machine.all
    end
    
    def new
        @machine = Machine.new
        @machine.machine_details.build.build_year
    end
    
    def create
        @machine = Machine.new(machine_params)
        if @machine.save
            flash[:success] = "New machine successfully added!"
            redirect_to admin_machines_path
        else
            render :new
        end
    end
    
     private
        def machine_params
            params.require(:machine).permit(:title, machine_details_attributes: [:year_id, :group_id, :make_id, :identifier_id])
        end
        
end
