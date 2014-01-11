{-# LANGUAGE OverloadedStrings, TemplateHaskell, DeriveGeneric, ScopedTypeVariables #-}
module Dashboardh ( module X, dash ) where

import Dashboardh.Prelude as X
import Dashboardh.Status as X
import Web.Scotty
import Debug.Trace
import Data.Text.Lazy
import Data.Aeson           (ToJSON)

dash :: ScottyM ()
dash = do
    get "/" $ do 
        file "src/web/index.html"

    -- High level
    get "/status/" $ do
        jobs <- liftIO $ getJenkins getJobs          
        returnResult jobs   

    -- Views
    get "/status/view/:name" $ do
        view <- param "name"
        jobs <- liftIO . getJenkins $ getViewJobs view
        returnResult jobs   

    -- Job level
    get "/status/job/:job/" $ do 
        a <- param "job"
        dat <- liftIO . getJenkins $ getJob (toStrict a)
        returnResult dat

    -- Job level
    get "/status/job/:job/:call" $ do 
        (_:(_,a):_) <- params
        dat <- liftIO . getJenkins $ getJob (toStrict a)
        returnResult dat

    -- Build level
    get "/status/job/:job/:number/:call" $ do
        job <- params
        json $ job


    get "/statistics" $ do
        error("todo")

returnResult :: ToJSON a => [a] -> ActionM ()
returnResult [] = 
    text "Jenkins not available"
returnResult l =
    json $ l