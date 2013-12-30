{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Dashboardh.Status(
   getJenkins
 , getSimpleJob
 , getJobStatus
 , getJobStatusHistory
 , getJobTimeHistory
 ) where

import Dashboardh.Prelude
import Dashboardh.Job
import Dashboardh.Core
import Data.Text                (Text)
import Options.Applicative
import Control.Lens
import Control.Lens.Aeson
import Jenkins.REST
import Debug.Trace


data Hole = Hole

getJenkins :: IO [Job]
getJenkins = do
    let opts = Settings "http://10.128.131.84" 8090 "" ""
    jobs <- getJobs opts
    case jobs of
        Right l -> return $ l
        Left  _  -> return $ []


getJobs :: Settings -> IO (Either Disconnect [Job])
getJobs settings = runJenkins settings $ do
  res <- get (json -?- "tree" -=- "jobs[name]")
  let jobs = (trace (show res) res) ^.. key "jobs"._Array.each.key "name"._String
  concurrentlys (map (\n -> do return $ Job n 0 0 0 0) jobs)




-- Wrap following operations in Json call to jenkins

getSimpleJob :: Text -> Job
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

