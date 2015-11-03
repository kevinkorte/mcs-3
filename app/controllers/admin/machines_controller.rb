class Admin::MachinesController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def index
        @machine = Machine.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 30)    end
    
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
    
    def edit
        @machine = Machine.friendly.find(params[:id])
        @group_id = @machine.group.map do |group| group.id end
        @year_id = @machine.years.map do |year| year.id end
        @make_id = @machine.makes.map do|make| make.id end
        @model_id = @machine.identifiers.map do |model| model.id end
        
    end
    
    def update
        @machine = Machine.friendly.find(params[:id])
            @machine.update_attributes(machine_params)
            flash[:success] = "Updated Successfully!"
            if @machine.save
                redirect_to action: "index"
            else
                render "edit"
            end
    end
    
    private
        def machine_params
            params.require(:machine).permit(:id,:title, machine_details_attributes: [:year_id, :group_id, :make_id, :identifier_id, :id])
        end
        
end
