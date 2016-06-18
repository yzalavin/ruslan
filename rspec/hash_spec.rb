require_relative '../initializer/hash'

describe Hash do
  let(:hash) { { 'hello' => 'world' } }
  let(:one_level) { { 'foo' => 'bar' } }
  let(:deep) { { 'foo' => 'bar', 'baz' => { 'bar' => 'more' } } }

  describe '#deep_symbolize_keys' do
    # it 'will respond to this method' do
    #   expect(hash).to respond_to :deep_symbolize_keys
    # end

    it 'will symbolize one level hash' do
      expect(one_level[:foo]).to eq 'bar'
    end
  end
end
