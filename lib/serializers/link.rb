class Serializers::Link < Serializers::Base
  structure(:default) do |arg|
    {
      id:         arg.uuid,
      title:      arg.title,
      url:        arg.url,
      created_at: arg.created_at.try(:iso8601),
      updated_at: arg.updated_at.try(:iso8601),
      tags:       tag_serialize(arg.tags, :default)
    }
  end

  def self.tag_serialize(tags, version)
    serialize(tags, version)
  end

  def self.serialize(obj, version)
    @serializer ||= Serializers::Tag.new(version)
    @serializer.serialize(obj)
  end

end
