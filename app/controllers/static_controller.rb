class StaticController < ApplicationController
    
    def home
        @machines = Machine.all.count
        @parts = Part.all.count
    end
end
