class Application < Sequel::Model
  plugin :timestamps
  plugin :validation_helpers

  def validate
    super
    validates_presence [:name]
  end
end
