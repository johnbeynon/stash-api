module Endpoints::V1
  class Collections < Base
    namespace "/collections" do

      get do
        respond_with Collection.all
      end

      post do
        respond_with Mediators::Collection::Creator.new(
          request_body
        ).call, 201
      end

      get "/:id" do
        respond_with Collection.where(uuid: params[:id]).first
      end

      patch "/:id" do
        respond_with Mediators::Collection::Updater.new(
          params[:id],
          request_body,
        ).call
      end

      delete "/:id" do
        respond_with Mediators::Collection::Destroyer.new(
          params[:id],
        ).call
      end
      
    end

    private

    def serializer
      Serializers::Collection.new(:default)
    end

  end

end
