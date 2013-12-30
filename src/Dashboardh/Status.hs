{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Dashboardh.Status(
   getJenkins
 , getJobs
 , getViewJobs
 , getJob
 ) where

import Dashboardh.Prelude
import Dashboardh.Job
import Dashboardh.Core
import Data.Text                (Text)
import Options.Applicative
import Control.Lens             hiding (view)
import Control.Lens.Aeson
import Jenkins.REST
import Debug.Trace


data Hole = Hole

getJenkins :: (Settings -> IO (Either Disconnect [a])) -> IO [a]
getJenkins f = do
    let opts = Settings "http://10.128.131.84" 8090 "" ""
    jobs <- f opts
    case jobs of
        Right l -> return $ l
        Left  _  -> return $ []

getJobs :: Settings -> IO (Either Disconnect [Text])
getJobs settings = runJenkins settings $ do
  res <- get (json -?- "tree" -=- "jobs[name]")
  let jobs = res ^.. key "jobs"._Array.each.key "name"._String
  concurrentlys (map (\n -> do return $ n) jobs)

getViewJobs :: Text -> Settings -> IO (Either Disconnect [Text])
getViewJobs v settings = runJenkins settings $ do
  res <- get (view v `as` json -?- "tree" -=- "jobs[name]")
  let jobs = (trace (show res) res) ^.. key "jobs"._Array.each.key "name"._String
  concurrentlys (map (\n -> do return $ n) jobs)

getJob :: Text -> Settings -> IO (Either Disconnect [Job])
getJob j settings = runJenkins settings $ do
  res <- get (job (trace (show j) j) `as` json -?- "tree" -=- "builds[duration,number,result,builtOn]")
  let jobs = (trace (show res) res) ^.. key "jobs"._Array.each.key "name"._String
  concurrentlys (map (\n -> do return $ Job n 0 "" "") (trace (show jobs) jobs))


-- Wrap following operations in Json call to jenkins

getSimpleJob :: Text -> Text
getSimpleJob =
    error("handle jenkins json")

getJobStatus :: Text -> Int
getJobStatus =
    error("return current build status")

getJobStatusHistory :: Text -> Int
getJobStatusHistory =
    error("return list of build status")    

getJobTimeHistory :: Text -> Int
getJobTimeHistory =
    error("return list of build times")    

