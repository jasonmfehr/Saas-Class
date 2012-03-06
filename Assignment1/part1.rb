def palindrome?(value)
  strippedval = value.gsub(/\W/, "").downcase 
  reversedval = strippedval.reverse
  reversedval == strippedval
end

def runtest(test_str,expected)
  actual = palindrome?(test_str)
  if actual != expected
    print "fail", "\n"
  else
    print "pass", "\n"
  end
  print "fail" if actual != expected
end

runtest("HELLO-%WORLDdlrOWolleh", true)
runtest("A man, a plan, a canal -- Panama", true)
runtest("Madam, I'm Adam!", true)
runtest("Abracadabra", false)


def count_words(str)
  count = Hash.new()
  str.scan(/\w+/){
    |w|
    unless count[w.downcase]
      count[w.downcase] = 0
    end
    
    count[w.downcase] = count[w.downcase].next()
  }
  
  return count
end


print count_words("Hi mom hi dad"), "\n"
print count_words("A man, a plan, a canal -- Panama"), "\n"
print count_words("Doo bee doo bee doo"), "\n"