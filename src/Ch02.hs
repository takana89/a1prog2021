module Ch02 where


wcl :: String -> String
wcl = (++ "\n") . show . countNL

countNL :: String -> Int
countNL = length . lines
