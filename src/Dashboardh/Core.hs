{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.Core (
  site
) where

import Data.Text.Lazy       (Text) 
import Web.Scotty           hiding (body)

site :: Text -> ActionM()
site a = 
    html a