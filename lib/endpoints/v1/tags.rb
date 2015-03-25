module Endpoints::V1
  class Tags < Base
    namespace "/tags" do

      post do
        status 201
        encode Hash.new
      end

      get "/:id" do
        encode Hash.new
      end

      patch "/:id" do
        encode Hash.new
      end

      delete "/:id" do
        encode Hash.new
      end
    end

    namespace '/collections' do  
      get '/:collection_id/tags' do
        collection = Collection.find(uuid: params[:collection_id])
        respond_with collection.tags
      end
    end

    private

    def serializer
      Serializers::Tag.new(:default)
    end
  end
end
