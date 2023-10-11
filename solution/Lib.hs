module Lib
  ( readInput, splitOn, splitOnFirst, mapPair
  , sort, group, nub, transpose, isPrefixOf, elemIndex, findIndex
  , fromJust
  , isLower, isAlpha, isDigit, ord, chr
  , (&), (>>>)
  )
where

import Data.List (sort, group, nub, transpose, isPrefixOf, elemIndex, findIndex)
import Data.Maybe (fromJust)
import Data.Char (isLower, isAlpha, isDigit, ord, chr)

import Data.Function ((&))
import Control.Arrow ((>>>))

import Text.Printf (printf)

readInput :: Int -> IO String
readInput = readFile . printf "../input/%02d.txt"

splitOn :: Eq a => a -> [a] -> [[a]]
splitOn a xs = case break (== a) xs of
    (_, [])      -> [xs]
    (xs, _ : ys) -> xs : splitOn a ys

splitOnFirst :: Eq a => a -> [a] -> ([a], [a])
splitOnFirst a xs = (ys, drop 1 zs)
  where (ys, zs) = break (== a) xs

mapPair :: (a -> b) -> (a, a) -> (b, b)
mapPair f (x, y) = (f x, f y)