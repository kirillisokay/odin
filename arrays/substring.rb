dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(string, dictionary)
  s = string.downcase.split
  h = Hash.new(0)
  dictionary.each do |word|
    s.each do |w|
      h[word] += 1 if w.include?(word)
    end
  end
  p h
end

substrings("Howdy partner, sit down! How's it going?", dictionary)
