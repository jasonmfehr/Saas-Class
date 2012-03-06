def combine_anagrams(words)
  all_words = {}
  words.each{
    |w|
    converted = w.downcase.chars.sort * ""
      
    print "Word: ", w, "\n"
    print "Conv: ", converted, "\n"
    
    if all_words.has_key?(converted)
      all_words[converted].push(w)
    else
      all_words[converted] = [w]
    end
  }
  
  return all_words.values
end

print combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream']), "\n"