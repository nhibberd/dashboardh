{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.Core(
    Hole(..)
  , avg
  ) where

import Dashboardh.Prelude
import Dashboardh.Job
import Data.Text                (Text)
import Data.List                (genericLength)

data Hole = Hole


avg :: [Int] -> Int
avg a =
  div (sum a) (genericLength a)

foo :: Int -> Int
foo a = a

jobz :: Text -> Job
jobz =
    error("todo")
