require_relative 'spec_helper'
require 'uri'

describe Parser::OLX do
  subject(:parser) { Parser::OLX.new }

  it 'will obtain a document' do
    expect(parser.document).to be_a Nokogiri::HTML::Document
  end

  it 'will retrieve an array of links' do
    expect(parser.send(:requested_flats)).to be_a Array
    expect(parser.send(:requested_flats).length).to be > 1
    expect(parser.send(:requested_flats).all? { |l| l =~ URI::regexp }).to be true
  end

  it 'will store those links at database' do
    expect{ parser.insert_links }.to change { parser.send(:table).all.count }
  end
end
