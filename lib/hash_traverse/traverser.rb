module HashTraverse
  class Traverser

    # TODO English translation: currently lang:ja
    #
    # NOTE 値が falsy object だった場合にはそれを取得するため、safe_fetch では
    #      単純な真偽以外で判定する必要あり
    #      テキトウなオブジェクトを返すようにし、その equality で結果有無を判定する
    @@missing_token = Object.new

    def initialize(hash)
      @hash = hash
    end

    def traverse(*keys, &missing_handler)
      found_keys   = []

      keys.inject(@hash) do |parent, key|
        if (result = safe_fetch(parent, key)).equal?(@@missing_token)
          break handle_missing(missing_handler, found_keys, parent)
        else
          found_keys << key
          result
        end
      end
    end

    private

    def handle_missing(handler, keys, parent)
      handler ? handler.call(keys, parent) : nil
    end

    def safe_fetch(parent, key)
      if hashy?(parent) && parent.has_key?(key)
        parent.fetch(key)
      else
        @@missing_token
      end
    end

    def hashy?(object)
      object.respond_to?(:has_key?) && object.respond_to?(:fetch)
    end
  end
end
