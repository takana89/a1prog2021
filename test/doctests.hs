module Main where

import Test.DocTest

main :: IO ()
main = doctest ["src/Ch01.hs"]
