class CartesianProduct
  include Enumerable
  # your code here
  def initialize(element1, element2)
    @result_set = []
    element1.each do |el1|
      element2.each do |el2|
        current_ele = Array.new([el1])
        current_ele << el2
        @result_set << current_ele
      end
    end
    @result_set
  end

  def each
    @result_set.each { |i| yield i}
  end

end

#p CartesianProduct.new([:a,:b], [4,5])

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty
