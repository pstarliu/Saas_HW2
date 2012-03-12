class String

  def palindrome?
    return self.gsub(/\W/, '').downcase == self.gsub(/\W/, '').downcase.reverse
  end

end
