class Dessert
  attr_accessor :name, :calories
  
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    return @calories < 200
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  
  def delicious?
    return !(@flavor.match(/^black licorice$/i) && @name.match(/^JellyBean$/i))
  end
end

d1 = Dessert.new("ice cream", 500)
d2 = Dessert.new("bannana ice cream", 150)
print "d1: ", d1.name(), " - ", d1.calories, " - ", d1.healthy?, "\n"
print "d2: ", d2.name(), " - ", d2.calories, " - ", d2.healthy?, "\n"

j1 = JellyBean.new("ice cream", 500, "black licorice")
j2 = JellyBean.new("JellyBean", 500, "Black licorice")
print "j1: ", j1.name(), " - ", j1.calories, " - ", j1.flavor, " - ", j1.healthy?, " - ", j1.delicious?, "\n"
print "j2: ", j2.name(), " - ", j2.calories, " - ", j2.flavor, " - ", j2.healthy?, " - ", j2.delicious?, "\n"
