require_relative 'spec_helper'

describe Hash do
  let(:hash) { { 'hello' => 'world' } }
  let(:one_level) { { 'foo' => 'bar' } }
  let(:deep) { { 'foo' => { 'bar' => { 'baz' => 'star' } } } }

  describe '#deep_symbolize_keys' do
    it 'will respond to this method' do
      expect(hash).to respond_to :deep_symbolize_keys
    end

    it 'will symbolize one level hash' do
      expect(one_level.deep_symbolize_keys[:foo]).to eq 'bar'
    end

    it 'will symbolize deep hashes' do
      expect(deep.deep_symbolize_keys[:foo]).to eq({ bar: { baz: 'star' } })
    end
  end
end
