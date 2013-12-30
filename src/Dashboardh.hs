{-# LANGUAGE OverloadedStrings, TemplateHaskell, DeriveGeneric, ScopedTypeVariables #-}
module Dashboardh ( module X, dash ) where

import Dashboardh.Prelude as X
import Dashboardh.Status as X
import Web.Scotty
import Debug.Trace

data Hole = Hole

dash :: ScottyM ()
dash = do
    get "/" $ do 
        file "src/web/index.html"

    get "/status/" $ do
        do 
            jobs <- liftIO getJenkins            
            json jobs

    get "/statistics" $ do
        error("todo")
