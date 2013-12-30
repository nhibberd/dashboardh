{-# LANGUAGE OverloadedStrings, TemplateHaskell, DeriveGeneric #-}
module Dashboardh ( module X, dash ) where

import Dashboardh.Prelude as X
import Dashboardh.Status as X
import Web.Scotty

data Hole = Hole

dash :: ScottyM ()
dash = do
    get "/" $ do 
        file "src/web/index.html"

    get "/status/" $ do
        undefined --foldr (\a -> json a) undefined (getJenkins)

    get "/statistics" $ do
        error("todo")
