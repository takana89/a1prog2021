module Ch01 where

import Data.Char
import Data.List ( inits, tails, transpose ) 
import Data.Set (Set)
import qualified Data.Set as Set
import Text.Printf
import System.Random.Shuffle
import Control.Monad.Random  hiding (interleave)

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
wordLengths = map length . words . removeCommaAndPeriod

-- gonyo :: String ->[Int]
-- gonyo = monyo . words

-- monyo :: [String] -> [Int]
-- monyo = map length

{-
map f リスト
hoge = map toUpper
-}

removeCommaAndPeriod :: String -> String
removeCommaAndPeriod = filter isNotCommaAndNotPeriod

isNotCommaAndNotPeriod :: Char -> Bool
isNotCommaAndNotPeriod ',' = False
isNotCommaAndNotPeriod '.' = False
isNotCommaAndNotPeriod _   =  True

-- 04 元素記号

type Dict = [(Int, String)]

gensokigouDict :: String -> Dict
gensokigouDict = map kigou . numbering . words
{-
gensokigouDict = numbering . map kigou . words

kigou :: String -> String
kigou = undefined
-}
numbering :: [String] -> [(Int, String)]
numbering = zip [1 ..]

kigou :: (Int, String) -> (Int, String)
kigou (i, str)
    | i == 12       =(i, "Mg")
    | i `elem` nums =(i, take 1 str)
    | otherwise     =(i, take 2 str)

text1 :: String
text1 = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause Arthur King Can."

nums :: [Int]
nums = [1, 5, 6, 7, 8, 9, 15, 16, 19]

-- 05 N-gram
bigram ::[a] -> [(a,a)]
bigram xs = zip xs (tail xs)

text2 :: String
text2 = "I am an NLPer"

tangoBigram :: [(String, String)]
tangoBigram = bigram (words text2)

mojiBigram :: [(Char, Char)]
mojiBigram = bigram text2

-- (a, a) と (a, a, a) は別の型

ngram :: Int -> [a] -> [[a]]
ngram n xs = transpose (map inits (tails xs)) !! n

-- 06 集合

str1 :: String
str1 = "paraparaparadise"
str2 :: String
str2 = "paragraph"

xs :: [(Char, Char)]
xs = bigram str1

ys :: [(Char, Char)]
ys = bigram str2

_X :: Set (Char, Char)
_X = Set.fromList xs

_Y :: Set (Char, Char)
_Y = Set.fromList ys

waXY :: Set (Char, Char)
waXY = Set.union _X _Y

sekiXY :: Set (Char, Char)
sekiXY = Set.intersection _X _Y

saXY :: Set (Char, Char)
saXY = Set.difference _X _Y

-- 07. テンプレートによる文生成

sentense :: Int -> String -> Double -> String
sentense x y z = printf "%d時の%sは%f" x y z

sentense' :: Int -> String -> Double -> String
sentense' x y z = show x ++ "時の" ++ y ++ "は" ++ show z

-- 08 暗号文

cipher :: String -> String
cipher = map encode

encode :: Char -> Char
encode c
    | isAsciiLower c = chr (219 - ord c)
    | otherwise      = c

-- Typoglycemia

sample2 :: String
sample2 = "I couldn't believe that I could actually umderstand what I was reading : the phenomenal power of the human mind ."

typoglycemia :: String -> String
typoglycemia = unwords . map typo . words

typo :: String -> String
typo w
    | len < 5 = w
    | otherwise   = [h] ++ shuffle' ms len' (mkStdGen len') ++ [t]
    where
        len = length w
        len' = len -2
        h = head w
        t = last w
        ms = take len' (tail w)

