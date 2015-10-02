class MachineDetail < ActiveRecord::Base
    belongs_to :year
    belongs_to :machine
    
    accepts_nested_attributes_for :year
end
