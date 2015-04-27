module HashTraverse
  class Traverser
    def initialize(hash)
      @hash = hash
    end

    def traverse(*keys, &missing)
      found_keys = []

      keys.inject(@hash) {|parent, key|
        if child = safe_fetch(parent, key)
          found_keys << key
          next child
        else
          break handle_missing(missing, found_keys, parent)
        end
      }
    end

    private

    def handle_missing(missing, keys, parent)
      missing ? missing.call(keys, parent) : nil
    end

    def safe_fetch(parent, key)
      parent.is_a?(Hash) ? parent[key] : nil
    end
  end
end
