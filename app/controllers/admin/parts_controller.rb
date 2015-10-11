class Admin::PartsController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def index
        @q = Part.ransack(params[:q])
        @results = @q.result.paginate(:page => params[:page])
        @parts = Part.all
    end
end
