class CartesianProduct
  include Enumerable
  
  def initialize(e1, e2)
    @e1 = e1
    @e2 = e2
  end
  
  def each
    @e1.each {
      |item1|
      @e2.each {
        |item2|
        yield([item1, item2])
      }
    }
  end
  
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
  
c = CartesianProduct.new([:a,:b,:c], [4,5])
c.each { |elt| puts elt.inspect }
  
c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)