module HashTraverse
  class Traverser
    FetchResult = Struct.new(:value, :is_fetched)

    def initialize(hash)
      @hash = hash
    end

    def traverse(*keys, &missing)
      found_keys   = []

      keys.inject(@hash) do |parent, key|
        if (result = safe_fetch(parent, key)).is_fetched
          found_keys << key
          result.value
        else
          handle_missing(missing, found_keys, parent)
        end
      end
    end

    private

    def handle_missing(missing, keys, parent)
      missing ? missing.call(keys, parent) : nil
    end

    def safe_fetch(parent, key)
      if parent.respond_to?(:has_key?) && parent.respond_to?(:fetch)
        FetchResult.new(parent.fetch(key) { nil }, parent.has_key?(key))
      else
        FetchResult.new(nil, false)
      end
    end
  end
end
