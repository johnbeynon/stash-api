module Mediators::Collection
  class Updater < Mediators::Base
    def initialize(id, args)
      @id           = id
      @args         = filter_args(args, allowed_fields)
    end

    def call
      collection = Collection.find(uuid: @id)
      collection.update(@args)
      collection
    end

    private
    def allowed_fields
      [:name]
    end
  end
end
