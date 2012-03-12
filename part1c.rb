module Enumerable
  def palindrome?
    normalized_str = self.inject('') {|sum, i| sum + i.to_s}.gsub(/\W/, '').downcase
    return normalized_str == normalized_str.reverse
  end
end
