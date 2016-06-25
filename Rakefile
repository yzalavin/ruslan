# frozen_string_literal: true

require_relative 'initializer/sequel'

namespace :db do
  desc 'Require environment'
  task :environment do
    @db = Database.new
  end

  desc 'Load necessary Sequel extensions'
  task :load_extension do
    Sequel.extension :migration
  end

  desc 'Create database'
  task create: :environment do
    commands = ['createdb']
    commands << "--username #{@db.config[:user]}"
    commands << "--host #{@db.config[:host]}"
    commands << "--port #{@db.config[:port]}"
    commands << "--owner #{@db.config[:user]}"
    commands << 'ted'
    exec commands.join(' ')
  end

  desc 'Drop database'
  task drop: :environment do
    commands = ['dropdb']
    commands << "--username #{@db.config[:user]}"
    commands << "--host #{@db.config[:host]}"
    commands << "--port #{@db.config[:port]}"
    commands << 'ted'
    exec commands.join(' ')
  end

  desc 'Run migrations'
  task migrate: [:environment, :load_extension] do |_t, args|
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(
        @db.connection,
        @db.migrations_path,
        target: args[:version].to_i
      )
    else
      puts 'Migrating to latest'
      Sequel::Migrator.run(
        @db.connection,
        @db.migrations_path
      )
    end
  end

  desc 'Rollback last migration'
  task rollback: [:environment, :load_extension] do
    table_name = :schema_info

    if @db.connection.tables.include?(table_name)
      current_version = @db.table(table_name).order(:version).last[:version]
      version = current_version > 1 ? current_version - 1 : 0
    else
      version = 0
    end

    Sequel::Migrator.run(
      @db.connection,
      @db.migrations_path,
      target: version
    )
  end
end
