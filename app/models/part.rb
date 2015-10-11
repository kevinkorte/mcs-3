class Part < ActiveRecord::Base
    
    def new
        @airfilter = AirFilter.new
        @list_all_af = AirFilter.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    end
end
