module Main (main) where

import Control.Applicative (liftA3)
import Data.Bool (bool)
import Data.Char (chr, isAsciiLower, isAsciiUpper, ord)
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)

main :: IO ()
main =
  hSetBuffering stdout NoBuffering
    >> putStr "Enter string to encode: "
    >> getLine
    >>= ( putStrLn
            . ("Encoded string: " <>)
            . map
              ( liftA2
                  (.)
                  (flip ($ 'a') isAsciiLower)
                  (flip ($ 'A') isAsciiUpper)
                  ( liftA3 bool id
                      . (chr .)
                      . (((.) . (+) . ord) <*> ((((`mod` 26) . (+ 13)) .) . (. ord) . subtract . ord))
                  )
              )
        )
