module HashTraverse
  class Traverser
    def initialize(hash)
      @hash = hash
    end

    def traverse(*keys, &missing)
      found_keys = []

      keys.inject(@hash) do |parent, key|
        begin
          if parent.respond_to?(:fetch)
            parent.fetch(key).tap { found_keys << key }
          else
            handle_missing(missing, found_keys, parent)
          end
        rescue KeyError
          break handle_missing(missing, found_keys, parent)
        end
      end
    end

    private

    def handle_missing(missing, keys, parent)
      missing ? missing.call(keys, parent) : nil
    end

    def safe_fetch(parent, key)
      parent.respond_to?(:fetch) ? parent.fetch(key) : nil
    end
  end
end
