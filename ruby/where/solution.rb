require 'pry'

module ArrayWhere
  HASH_CLASS = Hash
  REG_EX = Regexp

  def where(query)
    # Throw ArgumentError if the input query is not a Hash
    raise ArgumentError.new('Input should be a hash') unless is_hash?(query)

    results_array = []
    # Iterate over key-value pairs in query
    query.each do |key, value|
      if results_array.empty?
        results_array = query_array(self, key, value)
      else
        results_array = query_array(results_array, key, value)
      end
    end

    results_array.compact.flatten.uniq
  end

  private

  def query_array(objects, query_key, query_value)
    objects.select do |object|
      if object.key?(query_key)
        value_match?(object[query_key], query_value)
      end
    end
  end

  def value_match?(actual, query)
    if is_regex?(query)
      actual.match(query)
    else
      actual === query
    end
  end

  def is_regex?(val)
    val.class == REG_EX
  end

  def is_hash?(query)
    query.class == HASH_CLASS
  end
end

class Array
  include ArrayWhere
end
