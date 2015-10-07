class Identifier < ActiveRecord::Base
    has_many :machine_details
    has_many :machines, :through => :machine_details
    
    validates :identifier, presence: true
    validates :identifier, uniqueness: { case_sensitive: false }
    
    def as_json(options)
        { id: id, text: identifier }
    end
    
end
