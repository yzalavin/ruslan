Sequel.migration do
  change do
    create_table(:flats) do
      primary_key :id
      String :link
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
