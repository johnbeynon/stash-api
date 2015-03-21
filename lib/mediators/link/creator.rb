module Mediators::Link
  class Creator < Mediators::Base
    def initialize(args)
      @args = filter_args(args, allowed_fields).merge(type: 'Link')
    end

    def call
      link = create_link
    end

    private

    def create_link
      Resource.create @args
    end

    def allowed_fields
      [:title, :url, :excerpt, :response_code, :collection_id]
    end
  end
end
