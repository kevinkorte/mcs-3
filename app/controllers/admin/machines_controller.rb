class Admin::MachinesController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        
    end
    
    def show
    end
    
    def new
        @machine = Machine.new
    end
    
    def edit
    end
    
    def create
        @machine = Machine.new(machine_params)
        if @machine.save
            redirect_to @machine, notice: "New Machine Created"
        else
            render :new
        end
        
    end
    
    
    private
        def machine_params
            params.require(:machine).permit(:title)
        end
end
