import Data.Char

cRot13 :: Char -> Char
cRot13 c
	| 'a' <= c && c <= 'z' = chr ((ord c - ord 'a' + 13) `mod` 26 + ord 'a')
	| 'A' <= c && c <= 'Z' = chr ((ord c - ord 'A' + 13) `mod` 26 + ord 'A')
	| otherwise            = c

sRot13 :: [Char] -> [Char]
sRot13 (c:str) = (cRot13 c) : sRot13 str
sRot13 _       = []

main = do
	putStr "Enter string to encode: "
	s <- getLine
	putStr "Encoded string: "
	putStrLn (sRot13 s)
