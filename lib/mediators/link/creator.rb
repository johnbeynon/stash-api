module Mediators::Link
  class Creator < Mediators::Base
    def initialize(args)
      @args = filter_args(args, allowed_fields).merge(type: 'Link')
    end

    def call
      link = create_link
      # Handle tagging
      @args[:tags].each do |tag|
        tag = Tag.find_or_create(name: tag, collection_id: @args[:collection_id])
        link.add_tag(tag)
      end

      # Process callbacks
      LinkCallbacks.perform_async(link.uuid)
      link
    end

    private

    def create_link
      Resource.create @args.except(:tags)
    end

    def allowed_fields
      [:title, :url, :tags, :collection_id]
    end
  end
end
