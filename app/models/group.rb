class Group < ActiveRecord::Base
    has_many :machine_details
    has_many :machines, :through => :machine_details
    
    validates :group, presence: true
    validates :group, uniqueness: true
end
