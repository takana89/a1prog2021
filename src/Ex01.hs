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
palindromeKai str = palindrome str''
    where
        str' = filter isLetter str
        str'' = map toLower str'

sample1 :: String
sample1 = "Madam, I'm Adam."

{-
同値性の検査をする演算子 ==
-}

