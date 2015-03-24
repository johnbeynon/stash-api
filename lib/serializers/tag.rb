class Serializers::Tag < Serializers::Base
  structure(:default) do |arg|
    {
      id:         arg.uuid,
      name:       arg.name,
    }
  end
end
