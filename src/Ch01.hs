module Ch01 where

-- 00. "stressed" の逆順
ans00 :: String
ans00 = reverse "stressed"

omake00 :: String
omake00 = reverse "たけやぶやけたぞ"

--01. パタトクカシーー
ans01 :: String
ans01 = takeodds "パタトクカシーー"

takeodds :: String -> String
takeodds [] = ""
takeodds (c:cs) = c : takeodds (drop 1 cs)