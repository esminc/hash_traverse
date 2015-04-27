module HashTraverse
  class Traverser
    def initialize(hash)
      @hash = hash
    end

    def traverse(*keys, &missing)
      keys.inject(@hash) {|hash, key|
        hash[key]
      } || handle_missing(missing)
    end

    private

    def handle_missing(missing)
      missing ? missing.call : nil
    end
  end
end
