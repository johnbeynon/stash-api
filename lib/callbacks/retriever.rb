module Callbacks
  class Retriever

    # This indexes the the ticket in elastic search
    def initialize(app)
      @app = app
    end

    def call(resource)
      @resource = Resource[resource.id]
      #SearchService.index(@ticket.id)
      puts "Callbacks::Retriever"
      @app.call @resource
    end

  end
end
