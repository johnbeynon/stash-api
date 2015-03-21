#require_relative './format_helpers'


class Serializers::LinkSerializer < Serializers::Base
  structure(:default) do |arg|
    {
      id:         arg.uuid,
      title:      arg.title,
      url:        arg.url,
      created_at: arg.created_at.try(:iso8601),
      updated_at: arg.updated_at.try(:iso8601),
    }
  end
end
