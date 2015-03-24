module Mediators::Tags
  class Creator < Mediators::Base
    def initialize(args)
      @args = args
    end

    def call
      @args[:tags].each do |tag|
        Tag.find_or_create(name: tag, collection_id: @args[:collection_id])
      end
      
    end
  end
end
