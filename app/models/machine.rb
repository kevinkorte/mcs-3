class Machine < ActiveRecord::Base
    #These realy shouldn't be has_many
    #Build has_one through collection
    has_many :machine_details
    has_many :years, :through => :machine_details
    has_many :group, :through => :machine_details
    has_many :makes, :through => :machine_details
    has_many :identifiers, :through => :machine_details
    
    validates :title, presence: true
    validates :title, uniqueness: { case_sensitive: false }
    
    accepts_nested_attributes_for :machine_details
    
    after_save :enqueue_create_or_update_document_job
    
    private
    
    def enqueue_create_or_update_document_job
        Delayed::Job.enqueue CreateOrUpdateSwiftypeDocumentJob.new(self.id)
    end
end
