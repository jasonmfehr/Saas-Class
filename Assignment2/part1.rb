#----------------------------------------------------------------------------------------#
#  part a                                                                                #
#----------------------------------------------------------------------------------------#
class Numeric
  @@CONVERSION_TABLE = { "rupee_dollar" => 1.019, "yen_dollar" => 1.013, "euro_dollar" => 0.292, "dollar_rupee" => 0.019, "dollar_yen" => 0.013, "dollar_euro" => 1.292 }
  attr_accessor :currency_type
  
  def method_missing(id,*args)
    @currency_type = strip_extra(id)

    return self
  end
  
  def in(new_currency_type)
    key = "#{currency_type}_#{strip_extra(new_currency_type)}"

    return self * @@CONVERSION_TABLE[key]
  end
  
  def strip_extra(value)
    return value.to_s.downcase.gsub(/s$/, "")
  end
end

#print "d->r: #{1.dollars.in(:rupees)}\n"
#print "r->d: #{1.rupees.in(:dollars)}\n"
#print "y->d: #{1.yen.in(:dollar)}\n"
#print "d->y: #{1.dollar.in(:yens)}\n"
#print "e->d: #{1.euro.in(:dollar)}\n"
#print "d->e: #{1.dollar.in(:euros)}\n"



#----------------------------------------------------------------------------------------#
#  part b                                                                                #
#----------------------------------------------------------------------------------------#
class String
  def palindrome?
    strippedval = self.gsub(/\W/, "").downcase 
    reversedval = strippedval.reverse
    return reversedval == strippedval
  end
end

#print "true: #{"HELLO-%WORLDdlrOWolleh".palindrome?}\n"
#print "true: #{"A man, a plan, a canal -- Panama".palindrome?}\n"
#print "true: #{"Madam, I'm Adam!".palindrome?}\n"
#print "false: #{"Abracadabra".palindrome?}\n"



#----------------------------------------------------------------------------------------#
#  part c                                                                                #
#----------------------------------------------------------------------------------------#
module Enumerable
  def palindrome?
    all = String.new
    self.each do
      |val|
      all << val.to_s.gsub(/\W/, "").downcase
    end
    
    return all.reverse == all
  end
end

print "#{[0, 1, 2, 3].palindrome?}\n"
print "#{[0, 1, 2, [3, 5, 3], 2, 1, 0].palindrome?}\n"