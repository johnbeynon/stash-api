class Resource < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers

  def validate
    super
    validates_presence [:name]
    validates_presence [:collection_id]
    validates_presence [:type]
  end
end
