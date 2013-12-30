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

    -- High level
    get "/status/" $ do
        do 
            jobs <- liftIO getJenkins            
            json jobs

    -- Job level
    get "/status/:job/:call" $ do
        job <- params
        json $ job

    -- Build level
    get "/status/:job/:number/:call" $ do
        job <- params
        json $ job


    get "/statistics" $ do
        error("todo")
