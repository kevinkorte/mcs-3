class Year < ActiveRecord::Base
    has_many :machine_details
    has_many :machines, :through => :machine_details
end
