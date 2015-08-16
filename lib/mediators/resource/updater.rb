module Mediators::Resource
  class Updater < Mediators::Base

    def initialize(id, args)
      @id           = id
      @args         = filter_args(args, allowed_fields).merge(type: 'Link')
    end

    def call
      resource = Resource.find(uuid: @id)
      resource.update(@args)
      resource
    end

    private
    def allowed_fields
      [:title, :url, :collection_id]
    end
  end
end
