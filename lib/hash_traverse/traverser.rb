module HashTraverse
  class Traverser
    def initialize(hash)
      @hash = hash
    end

    def traverse(*keys)
      keys.inject(@hash) do |hash, key|
        hash[key]
      end
    end
  end
end
