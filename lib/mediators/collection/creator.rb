module Mediators::Collection
  class Creator < Mediators::Base
    def initialize(args)
      @args = filter_args(args, allowed_fields)
    end

    def call
      collection = create_collection
    end

    private

    def create_collection
      Collection.create @args
    end

    def allowed_fields
      [:name]
    end
  end
end
