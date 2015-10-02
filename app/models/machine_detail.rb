class MachineDetail < ActiveRecord::Base
    belongs_to :year
    belongs_to :machine
    belongs_to :group
    
    accepts_nested_attributes_for :year
    accepts_nested_attributes_for :group
end
