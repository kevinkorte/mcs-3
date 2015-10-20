class MachinesController < ApplicationController
    
    def show
        @machine = Machine.friendly.find(params[:id])
    end
    
end
