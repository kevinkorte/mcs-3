class Year < ActiveRecord::Base
    has_many :machine_details
    has_many :machines, :through => :machine_details
    
    validates :year, presence: true
    validates :year, uniqueness: true
end
