# DO NOT require hash_traverse/core_ext by default
RSpec.describe 'HashTraverse::CoreExt' do
  specify 'monkey path should not load automatically' do
    expect(defined?(HashTraverse::CoreExt)).to be_nil
  end

  context 'run monkey patch mode in a other process' do
    let(:script) do
      <<-RUBY
      require '#{File.dirname(__FILE__) + '/../../lib/hash_traverse/core_ext'}'

      p({foo: {hoi: 'hei'}, bar: 2}.traverse(:foo, :hoi)) # => 'hei'
      RUBY
    end

    specify do
      expect(`ruby -e "#{script.lines.join(';')}"`).to eq %Q{"hei"\n}
    end
  end
end
