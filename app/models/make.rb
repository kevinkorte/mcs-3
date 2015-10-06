class Make < ActiveRecord::Base
    has_many :machine_details
    has_many :machines, :through => :machine_details
    
    validates :make, presence: true
    validates :make, uniqueness: true
end
