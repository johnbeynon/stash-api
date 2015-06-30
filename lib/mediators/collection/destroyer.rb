module Mediators::Collection
  class Destroyer < Mediators::Base
    def initialize(id)
      @id = id
      @collection = ::Collection.find(uuid: id)
    end

    def call
      raise Pliny::Errors::NotFound unless @collection
      raise Pliny::Errors::UnprocessableEntity, "Collection has resources" if @collection.resources.count > 0
      @collection.destroy
    end
  end
end
