class Admin::GroupsController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def new
        @group = Group.new
    end
    
    def create
        @group = Group.new(group_params)
        if @group.save
            flash[:success] = "New type successfully added!"
            redirect_to admin_machines_path
        else
            render :new
        end
    end
    
     private
        def group_params
            params.require(:group).permit(:group)
        end
end
