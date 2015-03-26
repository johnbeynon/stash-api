module Mediators::Collection
  class Destroyer < Mediators::Base
    def initialize(id)
      @id = id
      @collection = ::Collection.find(uuid: id)
    end

    def call
      raise Pliny::Errors::NotFound unless @collection
      @collection.destroy
    end
  end
end
