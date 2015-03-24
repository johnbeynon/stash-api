Sequel.migration do
  change do
    create_join_table(
      :tag_id => {table: :tags, type: :uuid},
      :resource_id => {table: :resources, type: :uuid}
     )

    #alter_table(:tags_resources) do
    #  add_index :tag_id
    #  add_index :resource_id
    #end
  end
end
