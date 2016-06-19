require 'sequel'
require 'yaml'


class Database
  CONNECTION = Sequel.postgres('ted', ::YAML.load_file('config/database.yml').deep_symbolize_keys)

  def create_tables
    connection.create_table :olx do
      primary_key :id
      String :link
    end
  end

  def table(key)
    connection[key]
  end

  private

  def config
    YAML.load_file('config/database.yml').deep_symbolize_keys
  end

  def connection
    CONNECTION
  end
end
