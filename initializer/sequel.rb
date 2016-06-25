require_relative 'hash'
require 'sequel'
require 'yaml'
require 'pathname'

class Database
  def table(key)
    connection[key]
  end

  def migrations_path
    defined?(@migrations_path) ? @migrations_path : initialize_migrations_path
  end

  def connection
    @connection ||= Sequel.postgres('ted', ::YAML.load_file('config/database.yml').deep_symbolize_keys)
  end

  def config
    @config ||= YAML.load_file('config/database.yml').deep_symbolize_keys
  end

  private

  def initialize_migrations_path
    Pathname.new(File.expand_path('..', File.dirname(__FILE__))).join('db', 'migrations')
  end
end
