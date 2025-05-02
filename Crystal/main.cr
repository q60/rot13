puts "Enter string to encode:"
encoded = ""
if to_encode = gets
  to_encode.each_char do |char|
    case char.upcase
    when 'A'...'M'
      encoded += (char + 13)
    when 'N'...'Z'
      encoded += (char - 13)
    else
      encoded += char
    end
  end
end
puts "Encoded string:\n#{encoded}"