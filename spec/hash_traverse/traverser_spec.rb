RSpec.describe HashTraverse::Traverser do
  let(:hash) do
    {foo: {hoi: 'hei'}, bar: 2}
  end

  subject(:t) { HashTraverse::Traverser.new(hash) }

  context 'traverse simple hash over existing keys from README' do
    specify { expect(t.traverse(:foo)).to eq({hoi: 'hei'}) }
    specify { expect(t.traverse(:foo, :hoi)).to eq 'hei' }
    specify { expect(t.traverse(:foo, :poi)).to be_nil }
  end

  context 'return custom missing value' do
    specify { expect(t.traverse(:foo, :poi) { :null }).to eq :null }
  end

  context 'more complex missing value' do
    def missing_value_for(*keys)
      t.traverse(*keys) {|*args| args }
    end

    specify 'call missing block with found_keys& last parent' do
      expect(missing_value_for(:foo, :poi)).to eq [[:foo], {hoi: 'hei'}]
    end

    specify 'non-hash object also calls missing block' do
      expect(missing_value_for(:foo, :hoi, :oi)).to eq [[:foo, :hoi], 'hei']
    end
  end
end
