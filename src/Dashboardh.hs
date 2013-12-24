{-# LANGUAGE OverloadedStrings, TemplateHaskell, DeriveGeneric #-}
module Dashboardh ( module X, dash ) where

import Dashboardh.Core
import Dashboardh.Prelude as X
import Web.Scotty


dash :: ScottyM ()
dash = do
    get "/" $ do 
        file "src/web/index.html"

    get "/status" $ do
        error("todo")

    get "/statistics" $ do
        error("todo")
