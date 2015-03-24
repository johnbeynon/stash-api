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
        respond_with Resource.find(uuid: params[:id])
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

    namespace '/collections' do  
      get '/:collection_id/resources' do
        collection = Collection.find(uuid: params[:collection_id])
        respond_with collection.resources
      end
    end

    private
    
    def serializer
      Serializers::Link.new(:default)
    end

  end
end
