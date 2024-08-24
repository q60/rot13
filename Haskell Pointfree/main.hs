module Main (main) where

import Control.Monad (join, liftM2)
import Data.Char (chr, isAsciiLower, isAsciiUpper, ord)
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)

main :: IO ()
main =
  hSetBuffering stdout NoBuffering
    >> putStr "Enter string to encode: "
    >> getLine
    >>= putStrLn
      . ("Encoded string: " <>)
      . map
        ( liftM2
            (flip (flip . ((!!) .) . flip (:) . pure) . fromEnum)
            isAsciiLower
            (chr . (ord 'a' +) . (`mod` 26) . (13 +) . subtract (ord 'a') . ord)
            <*> join
              ( liftM2
                  (flip (flip . ((!!) .) . flip (:) . pure) . fromEnum)
                  isAsciiUpper
                  ( chr
                      . (ord 'A' +)
                      . (`mod` 26)
                      . (13 +)
                      . subtract (ord 'A')
                      . ord
                  )
              )
        )
