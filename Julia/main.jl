function ch(xs)
  encoded = ""
  for i in xs
    x = UInt32(uppercase(i))
    y = UInt32(i)
    if 65 <= x <= 90
      encoded *= string(Char(Int(y + (-13 * sign(x - 77.5)))))
    else
      encoded *= string(Char(y))
    end
  end
  return encoded
end
println("Enter string to encode:")
to_encode = readline()
println("Encoded string:\n$(ch(to_encode))")