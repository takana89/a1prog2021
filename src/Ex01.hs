module Ex01 where

import Data.Char

-- 文字型 Char
-- 文字列型 String = [Char]

-- 文字には文字番号が対応している
-- いわゆる半角英数はASCII

{- |
回文判定
>>> palindrome "たけやぶやけた"
True
>>> palindrome "abracadabra"
False
-}
palindrome :: String -> Bool --型シグネチャー
palindrome str = str == reverse str

{-
>>> palindromeKai "Madam, I'm Adam."
True
>>> palindromeKai "たけやぶ　やけた？"
True
-}
palindromeKai :: String -> Bool
-- palindromeKai str = palindrome (map toLowewr (filter isLetter str))
palindromeKai = palindrome . map toLower . filter isLetter

{-
h x = g (f x)

        f      g
    (x) -> (y) -> (z)
        -------->
            h
h は f と g を合成したもの
h :: x -> z
f :: x -> y
g :: y -> z

h = g . f
-}
sample1 :: String
sample1 = "Madam, I'm Adam."


otomojidake :: String -> String
otomojidake = filter isLetter

komojinisuru :: String -> String
komojinisuru = map toLower

{-
filter :: (a -> Bool) -> ([a] -> [a])
map :: (a -> b) -> ([a]-> [b])
-}


{-
同値性の検査をする演算子 ==
-}

