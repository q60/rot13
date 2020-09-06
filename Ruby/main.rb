puts 'Enter string to encode:'
encoded = ''
if to_encode = gets
  to_encode.each_char do |char|
    case char.upcase
    when 'A'...'M'
      encoded += (char.bytes[0] + 13).chr
    when 'N'...'Z'
      encoded += (char.bytes[0] - 13).chr
    else
      encoded += char.bytes[0].chr
    end
  end
end
puts "Encoded string:\n#{encoded}"
