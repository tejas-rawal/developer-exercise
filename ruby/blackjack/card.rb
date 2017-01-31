class Card
  attr_accessor :suite, :name, :value
  ACE = :ace

  def initialize(suite, name, value)
    @suite, @name, @value = suite, name, value
  end
end
