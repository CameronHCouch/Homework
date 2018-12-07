require 'rspec'
require 'simple_LRU_cache'

describe LRUCache do
  subject(:cache) {LRUCache.new(4)}

  describe '#initialize' do
    it 'creates an LRU Cache object with cache of empty array' do
      expect(cache.count).to be(0)
    end

    it 'has a max cache size determined by cache_size arg' do
      expect(cache.cache_size).to be(4)
    end

    it 'does not expose cache instance variable' do
      expect{ cache.cache }.to raise_error(NoMethodError)
    end
  end

    describe '#show' do
    it 'reveals the contents of the cache' do
      cache.add("hello")
      cache.add("my name is")
      cache.add("cmrn")
      expect(cache.show).to eq(["hello", "my name is", "cmrn"])   
    end
  end

  describe "#count" do
    it 'returns 0 if nothing has been added to the cache' do
      expect(cache.count).to be (0)
    end

    it 'returns the correct number of elements in the cache' do
      cache.add("hello")
      cache.add("my name is")
      cache.add("cmrn")
      expect(cache.count).to be(3)
    end
  end

  describe '#add' do
    it 'adds element to the cache' do
      cache.add('beep')
      expect(cache.show).to include('beep')
    end

    it 'adds the most recent element to the end of cache' do 
      cache.add("hello")
      cache.add("my name is")
      expect(cache.show.last).to eq("my name is")
    end

    it 'does not add the same element to the cache twice' do
      cache.add('beep')
      cache.add('sweep')
      cache.add('beep')
      expect(cache.count).to be(2)
    end

    it 'updates position of element to most recent if added again' do
      cache.add('beep')
      cache.add('sweep')
      cache.add('beep')
      expect(cache.show.last).to eq('beep')
    end

    it 'removes oldest item if this addition maxes out cache size' do
      cache.add("hello")
      cache.add("my name is")
      cache.add("cmrn")
      cache.add(10)
      cache.add(27)
      expect(cache.show).to_not include("hello")
      expect(cache.show).to include(27)
    end
  end
end