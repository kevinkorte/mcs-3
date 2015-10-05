class Admin::IdentifiersController < ApplicationController
    before_action :authenticate_admin!
    layout "admin"
    def index
        #identifier = Identifier.ransack(params[:q])
        @identifier = Identifier.where('identifier LIKE ?', "%#{params[:q][:term]}%")
        #@neighborhood = Neighborhood.select("id, name").where("name LIKE ?", "#{params[:name]}%").order(:name).limit(10)
        respond_to do |format|
          format.html
          format.json { render json: @identifier }
        end
    end
    def new
        @identifier = Identifier.new
    end
    
    def create
        @identifier = Identifier.new(identifier_params)
        if @identifier.save
            flash[:success] = "New model successfully added!"
            redirect_to admin_machines_path
        else
            render :new
        end
    end
    
     private
        def identifier_params
            params.require(:identifier).permit(:identifier)
        end
end
