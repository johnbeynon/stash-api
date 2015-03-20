class Resource < Sequel::Model

  TYPES = %w{Link}

  plugin :timestamps
  plugin :validation_helpers
  plugin :single_table_inheritance, :type

  def validate
    super
    validates_presence [:type, :collection_id]
    validates_includes TYPES, :type, message: "is not an allowed type"
  end

  def self.types
    TYPES
  end
end
