require 'sequel'

class Database
  attr_reader :connection

  def initialize
    @connection = Sequel.postgres('ted', database_config)
  end

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

  def database_config
    YAML.load_file('config/database.yml').deep_symbolize_keys
  end
end
