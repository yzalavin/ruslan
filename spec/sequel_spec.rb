require_relative '../base'

describe Database do
  subject(:db) { Database.new }

  it 'could establish connection to a postgres database' do
    expect(db.connection).to be_a Sequel::Postgres::Database
  end
end
