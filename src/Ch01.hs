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

--02
{- |
>>> putStr $ interleave "パトカー" "タクシー"
パタトクカシーー
-}
interleave :: [a] -> [a] -> [a]
interleave [] ys = []                      --(1)
interleave (x:xs) ys = x : interleave ys xs--(2)
{-
interleave "はれ" "あめ"
=> {"はれ" = 'は':"れ"}
interleave ('は':"れ") "あめ"
={(2)}
'は' : interleave "あめ" "れ"
={"あめ" = 'あ':"め"}
'は' : interleave ('あ':"め") "れ"
={(2)}
'は' : ('あ' : interleave "れ" "め")
= ("れ" = 'れ': [])
'は' : ('あ' : interleave ('れ':[]) "め")
={(2)}
'は' : ('あ' : ('れ' : interleave "め" []))
=
'は' : ('あ' : ('れ' : interleave ('め':[])[]))
=
'は' : ('あ' : ('れ' : ('め' : interleave [] [])))
={(1)}
'は' : ('あ' : ('れ' : ('め' : [])))
=
'は' : ('あ' : ('れ' : "め"))
=
'は' : ('あ' : "れめ")
=
'は' : "あれめ"
=
"はあれめ"
-}

--03 円周率
{-
1. ','と'.'を除く removeCommaAndPeriod
2. 単語に分ける words
3. 各単語の長さを求める関数lengthを適用 
-}
samplePi :: String
samplePi = "Now I need a drink, alcoholic of course after the heavy lectures involving quantum mechanics."

wordLengths :: String -> [Int] 
wordLengths = undefined

removeCommaAndPeriod :: String -> String
removeCommaAndPeriod = filter isNotCommaOrPeriod

isNotCommaOrPeriod :: Char -> Bool
isNotCommaOrPeriod ',' = False
isNotCommaOrPeriod '.' = False
isNotCommaOrPeriod _   =  True