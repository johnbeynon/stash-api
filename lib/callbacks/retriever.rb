module Callbacks
  class Retriever

    # This indexes the the ticket in elastic search
    def initialize(app)
      @app = app
    end

    def call(resource)
      title, first_para, images = UrlParser.parse(resource.url)
      puts resource.title
      resource.title = title
      resource.description = first_para
      resource.save
      
      @app.call resource
    end

  end
end
