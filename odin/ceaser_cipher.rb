def ceaser_cipher(string, shift_factor)
  string_ciphered = string.chars.map do |char|
    base = char.ord < 91 ? 65 : 97
    if char.match(/[A-Za-z]/)
      shifted = ((char.ord - base + shift_factor) % 26) + base
      shifted.chr
    else
      char
    end
  end
  string_ciphered.join
end

ceaser_cipher("What a string!", 5);
#"Bmfy f xywnsl!"