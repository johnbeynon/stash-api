module Endpoints::V1
  class Resources < Base
    namespace "/resources" do

      get do
        respond_with Resource.all
      end

      post do
        respond_with Mediators::Link::Creator.new(
          request_body
        ).call, 201
      end

      get "/:id" do
        resource = Resource.where(uuid: params[:id]).first
        encode resource
      end

      patch "/:id" do
        respond_with Mediators::Link::Updater.new(
          params[:id],
          request_body,
        ).call
      end

      delete "/:id" do
        encode Hash.new
      end
    end

    private
    
    def serializer
      Serializers::LinkSerializer.new(:default)
    end

  end
end
