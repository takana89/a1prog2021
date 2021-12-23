module Ch02 where

mywcl :: IO ()
mywcl = interact wcl

wcl :: String -> String
wcl = (++ "\n") . show . countNL

countNL :: String -> Int
-- countNL = length . filter isNL
countNL = length . lines

isNL :: Char -> Bool
isNL c
    | c == '\n' = True
    | otherwise = False
