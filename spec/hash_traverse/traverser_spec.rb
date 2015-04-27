RSpec.describe HashTraverse::Traverser do
  let(:hash) do
    {foo: {hoi: 'hei'}, bar: 2}
  end

  subject(:traverser) { HashTraverse::Traverser.new(hash) }

  specify { expect(traverser.traverse(:foo, :hoi)).to eq 'hei' }
end
