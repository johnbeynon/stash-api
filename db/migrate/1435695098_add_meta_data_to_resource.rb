Sequel.migration do
  up do
    add_column :resources, :meta_data, :json
  end

  down do
    drop_column :resources, :meta_data
  end
end
