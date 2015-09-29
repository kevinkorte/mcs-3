class Machine < ActiveRecord::Base
    
    
    after_save :enqueue_create_or_update_document_job
    
    private
    
    def enqueue_create_or_update_document_job
        Delayed::Job.enqueue CreateOrUpdateSwiftypeDocumentJob.new(self.id)
    end
end
