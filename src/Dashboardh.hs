{-# LANGUAGE OverloadedStrings, TemplateHaskell, DeriveGeneric, ScopedTypeVariables #-}
module Dashboardh ( module X, dash ) where

import Dashboardh.Prelude as X
import Dashboardh.Status as X
import Web.Scotty
import Debug.Trace
import Data.Text.Lazy

data Hole = Hole

dash :: ScottyM ()
dash = do
    get "/" $ do 
        file "src/web/index.html"

    -- High level
    get "/status/" $ do
        jobs <- liftIO $ getJenkins getJobs          
        json jobs   

    -- Views
    get "/status/view/:name" $ do
        view <- param "name"
        jobs <- liftIO . getJenkins $ getViewJobs view
        json jobs   

    -- Job level -- LOL
    get "/status/job/:job/:call" $ do 
        (_:(_,a):_) <- params
        dat <- liftIO . getJenkins $ getJob (toStrict a)
        json $ dat

    -- Build level
    get "/status/job/:job/:number/:call" $ do
        job <- params
        json $ job


    get "/statistics" $ do
        error("todo")
