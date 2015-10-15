class Machine < ActiveRecord::Base
    has_many :machine_details
    has_many :years, :through => :machine_details
    has_many :group, :through => :machine_details
    has_many :makes, :through => :machine_details
    has_many :identifiers, :through => :machine_details
    has_many :fitments
    has_many :parts, :through => :fitments
    
    validates :title, presence: true
    validates :title, uniqueness: { case_sensitive: false }
    
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    accepts_nested_attributes_for :machine_details
    
    after_save :enqueue_create_or_update_document_job
    
    def self.search(search)
        if search
            where('title LIKE ?', "%#{search}%")
        else
            all
        end
    end
    
    private
    
    def enqueue_create_or_update_document_job
        Delayed::Job.enqueue CreateOrUpdateSwiftypeDocumentJob.new(self.id)
    end
end
