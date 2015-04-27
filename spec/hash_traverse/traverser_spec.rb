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
end
