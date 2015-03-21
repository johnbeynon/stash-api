class Collection < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers

  one_to_many :resources

  def validate
    super
    validates_presence [:name]
  end
end
