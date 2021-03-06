require 'uri'

class Resource < Sequel::Model

  TYPES = %w{Link}

  plugin :timestamps
  plugin :validation_helpers
  plugin :single_table_inheritance, :type
  plugin :paranoid, enable_default_scope: true

  many_to_many :tags, left_key: :resource_id, right_key: :tag_id, left_primary_key: :uuid

  def validate
    super
    validates_presence [:type, :collection_id]
    validates_includes TYPES, :type, message: "is not an allowed type"
  end

  def self.types
    TYPES
  end

  def domain
    _url = URI.parse(url)
    _url.host.gsub('www.','')
  end
end
