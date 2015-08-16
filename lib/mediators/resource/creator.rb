module Mediators::Resource
  class Creator < Mediators::Base
    def initialize(collection_id, args)
      @collection_id = collection_id
      @args = filter_args(args, allowed_fields).merge(type: 'Link')
    end

    def call
      collection = Collection[@collection_id]
      puts collection
      raise Pliny::Errors::NotFound unless collection
      resource = collection.add_resource @args.except(:tags)
      # Handle tagging
      @args[:tags].each do |tag|
        tag = Tag.find_or_create(name: tag, collection_id: @collection_id)
        resource.add_tag(tag)
      end if @args[:tags]

      # Process callbacks
      LinkCallbacks.perform_async(resource.uuid)
      resource
    end

    private

    def allowed_fields
      [:title, :url, :tags, :collection_id]
    end
  end
end
