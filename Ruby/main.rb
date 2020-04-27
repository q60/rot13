class Main
  def self::encoder
    puts 'Enter string to encode:'
    @encode  = gets::chomp
    @encoded = ''
    @encode::each_char do |char|
      case char::upcase
      when 'A'...'M'
        @encoded += (char::bytes[0] + 13)::chr
      when 'N'...'Z'
        @encoded += (char::bytes[0] - 13)::chr
      else
        @encoded += char::bytes[0]::chr
      end
    end
    puts "Encoded string:\n#{@encoded}"
  end
end

if __FILE__ == $PROGRAM_NAME
  Main::encoder
end
