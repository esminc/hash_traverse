RSpec.describe HashTraverse::Traverser do
  let(:hash) do
    {foo: {hoi: 'hei'}, bar: 2}
  end

  subject(:t) { HashTraverse::Traverser.new(hash) }

  specify { expect(t.traverse(:foo)).to eq({hoi: 'hei'}) }
  specify { expect(t.traverse(:foo, :hoi)).to eq 'hei' }
  specify { expect(t.traverse(:foo, :poi)).to be_nil }
end
