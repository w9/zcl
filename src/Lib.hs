module Lib
    ( module Lib
    ) where

import System.Console.ANSI

wrap :: Char -> [SGR] -> String
wrap c color = setSGRCode color
            ++ [c] ++ setSGRCode []

colorLetter :: Char -> String
colorLetter c = 
  wrap c color
  where color = case c of
                  'A' -> [ SetColor Background Vivid Red    , SetColor Foreground Dull Black ]
                  'C' -> [ SetColor Background Vivid Yellow , SetColor Foreground Dull Black ]
                  'G' -> [ SetColor Background Vivid Green  , SetColor Foreground Dull Black ]
                  'T' -> [ SetColor Background Vivid Blue   , SetColor Foreground Dull Black ]
                  _   -> [ SetColor Background Dull  Black  , SetColor Foreground Dull White ]

colorLetters :: String -> String
colorLetters = concat . map colorLetter

cmdLine :: IO ()
cmdLine = do
  interact colorLetters
