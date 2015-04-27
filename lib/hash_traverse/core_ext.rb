require 'hash_traverse'

module HashTraverse
  module CoreExt
    def traverse(*keys, &block)
      HashTraverse::Traverser.new(self).traverse(*keys, &block)
    end
  end
end

Hash.send(:include, HashTraverse::CoreExt)
