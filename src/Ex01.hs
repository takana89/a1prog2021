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
palindrome :: String -> Bool
palindrome str =