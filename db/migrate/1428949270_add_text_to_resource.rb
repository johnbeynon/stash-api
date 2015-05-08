Sequel.migration do
  up do
    add_column :resources, :description, :text
  end

  down do
    drop_column :resources, :description
  end
end
