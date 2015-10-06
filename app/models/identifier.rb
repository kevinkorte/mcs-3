class Identifier < ActiveRecord::Base
    has_many :machine_details
    has_many :machines, :through => :machine_details
    
    validates :identifier, presence: true
    validates :identifier, uniqueness: { case_sensitive: false }
    
    #scope :finder, lambda { |q| where("identifier like :q", q: "%#{q}%") }

    def as_json(options)
        { id: id, text: identifier }
    end
    
    def self.search(search)
        if search
            where('title LIKE ?', "%#{search}%")
        else
            all
        end
    end
    
end
