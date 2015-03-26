class Tag < Sequel::Model
  plugin :timestamps
  plugin :paranoid, enable_default_scope: true
end
