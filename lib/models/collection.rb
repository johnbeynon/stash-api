class Collection < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers
  plugin :paranoid, enable_default_scope: true

  one_to_many :resources
  one_to_many :tags

  def validate
    super
    validates_presence [:name]
  end
end
