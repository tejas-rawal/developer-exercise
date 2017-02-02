module ArrayWhere
  HASH_CLASS = Hash
  REG_EX = Regexp

  def where(query)
    # Throw ArgumentError if the query input is not a Hash
    raise ArgumentError.new('Input should be a hash') unless is_hash?(query)

    # Immutability for data array being acted upon
    results = self

    # Iterate over key-value pairs in query and save results to results_array variable at each iteration.
    query.each do |key, value|
      results = query_array(results, key, value)
    end

    results
  end

  private

  def query_array(data, query_key, query_value)
    data.select do |object|
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
