{-# LANGUAGE OverloadedStrings, TemplateHaskell, DeriveGeneric #-}
module Dashboardh ( module X, dash ) where

import Dashboardh.Prelude as X
import Web.Scotty

data Hole = Hole

dash :: ScottyM ()
dash = do
    get "/" $ do 
        file "src/web/index.html"

    get "/status/:var/" $ do
        error("todo")

    get "/statistics" $ do
        error("todo")
