module Ch01 where

-- 00. "stressed" の逆順
{- |
>>> ans00
"desserts"
-}
ans00 :: String
ans00 = reverse "stressed"
-- reverse :: [a] -> [a] はリストを逆順にするPrelude関数
{- |
>>> putStrLn omake00
ぞたけやぶやけた
-}
omake00 :: String
omake00 = reverse "たけやぶやけたぞ"

--01. パタトクカシーー
ans01 :: String
ans01 = takeodds "パタトクカシーー"

{- | 文字列から奇数番目の文字だけとりだす
>>> putStrLn (takeodds "パタトクカシーー")
パトカー
>>> putStrLn (takeodds "hogehoge")
hghg
-}
takeodds :: [a] -> [a]
takeodds []     = []
takeodds (c:cs) = c : takeEvens cs

{- | リストから偶数番目の要素だけとりだす
>>> putStrLn (takeEvens "パタトクカシーー")
タクシー
-}
takeEvens :: [a] -> [a]
takeEvens [] = []
takeEvens (c:cs) = takeodds cs

sample :: String
sample = "パタトクカシーー"