{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.Core where

import Data.Text.Lazy       (Text) 
import Web.Scotty           hiding (body)

foo :: Int -> Int
foo a = a