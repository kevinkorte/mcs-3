class CreateOrUpdateSwiftypeDocumentJob < Struct.new(:machine_id)
    def perform
        machine = Machine.find(machine_id)
        url = Rails.application.routes.url_helpers.machine_url(machine)
        client = Swiftype::Client.new
        client.create_or_update_document(ENV['SWIFTYPE_ENGINE_SLUG'], ENV['SWIFTYPE_DOC'], {
            :external_id => machine.id,
            :fields => [
                {:name => 'title', :value => machine.title, :type => 'string'},
                {:name => 'url', :value => url, :type => 'enum'},
                {:name => 'created_at', :value => machine.created_at.iso8601, :type => 'date'}
            ]
        })
    end
end