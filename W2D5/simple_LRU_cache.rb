  class LRUCache
    def initialize(cache_size)
      @cache = []
      @cache_size = cache_size
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if cache_include?(el)
        remove(el)
        @cache.push(el)
      else
        @cache.push(el)
      end
      remove_oldest if cache_full?
      el
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!

    def remove(el)
      @cache.delete(el)
    end

    def cache_include?(el)
      @cache.include?(el)
    end

    def cache_full?
      count > @cache_size
    end

    def remove_oldest
      @cache.shift(1)
    end

  end