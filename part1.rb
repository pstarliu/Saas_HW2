# Homework part1
# metaprogramming to the rescue!

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(new_currency)
    singular_currency = new_currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    end
  end
end

module Enumerable
  def palindrome?
    normalized_str = self.to_a.inject('') {|sum, i| sum + i.to_s}.gsub(/\W/, '').downcase
    return normalized_str == normalized_str.reverse
  end
end

class String

  def palindrome?
    return self.gsub(/\W/, '').downcase == self.gsub(/\W/, '').downcase.reverse
  end

end

p 5.dollars
puts 5.dollars.in(:yen)
p 1.dollar.in(:rupees)
p 10.rupees.in(:euro)
p "foo".palindrome?
p "A man, a plan, a canal -- panama".palindrome?
p "Madam, I'm Adam!".palindrome?
p [1, 2, 3, 2, 1].palindrome?

