class Machine < ActiveRecord::Base
    has_many :machine_details
    has_many :years, :through => :machine_details
    
    after_save :enqueue_create_or_update_document_job
    
    private
    
    def enqueue_create_or_update_document_job
        Delayed::Job.enqueue CreateOrUpdateSwiftypeDocumentJob.new(self.id)
    end
end
