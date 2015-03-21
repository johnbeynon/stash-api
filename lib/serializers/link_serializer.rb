#require_relative './format_helpers'


class Serializers::LinkSerializer < Serializers::Base
  structure(:default) do |arg|
    {
      created_at: arg.created_at.try(:iso8601),
      id:         arg.uuid,
      title:      arg.title,
      url:        arg.url,
      updated_at: arg.updated_at.try(:iso8601),
    }
  end
end
