class Admin::AirFiltersController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def new
        @airfilter = AirFilter.new
        @list_all_af = AirFilter.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    end
    
    def create
        @airfilter = AirFilter.new(airfilter_params)
        @list_all_af = AirFilter.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
        if @airfilter.save
            redirect_to admin_parts_path
        else
            render :new
        end
    end
    
    private
        def airfilter_params
            params.require(:part).permit(:brand, :part_number)
        end
end
