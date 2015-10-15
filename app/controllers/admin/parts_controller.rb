class Admin::PartsController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def index
        @q = Part.ransack(params[:q])
        @results = @q.result.paginate(:page => params[:page])
        @parts = Part.all
    end
    
    def show
        @part = Part.find(params[:id])
    end
    
    def edit
        @part = Part.find(params[:id])
        @relative_machines = @part.machines
        @machines = Machine.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    end
    
    def update
        @part = Part.find(params[:id])
        if @part.attributes = {'machine_ids' => []}.merge(params[:part] || {})
            @part.update_attributes(update_params)
            flash[:notice] = 'Successful Update'
            redirect_to action: 'show', id: @part
        else
            render :action => 'edit'
        end
    end
    
    private
        
        def update_params
            params.require(:part).permit(:brand, :part_number)
        end
end
