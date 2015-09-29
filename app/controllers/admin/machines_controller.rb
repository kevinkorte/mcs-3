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
        
    end
    
    
    private
        def machine_params
            params[:machine]
        end
end
