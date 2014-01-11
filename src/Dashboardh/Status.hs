{-# LANGUAGE OverloadedStrings, TemplateHaskell, DeriveGeneric, ScopedTypeVariables #-}
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

getJenkins :: Jenkins [a] -> IO [a]
getJenkins f = do  
  let opts = Settings "http://10.128.131.84" 8090 "" ""
  jobs <- runJenkins opts f
  case jobs of
      Right l -> return l
      Left  _ -> return []

getJobs :: Jenkins [Text]
getJobs = do
  res <- get (json -?- "tree" -=- "jobs[name]")
  let jobs = res ^.. key "jobs"._Array.each.key "name"._String
  concurrentlys (map (\n -> do return $ n) jobs)

getViewJobs :: Text -> Jenkins [Text]
getViewJobs v = do
  res <- get (view v `as` json -?- "tree" -=- "jobs[name]")
  let jobs = res ^.. key "jobs"._Array.each.key "name"._String
  concurrentlys (map (\n -> do return $ n) jobs)

getJob :: Text -> Jenkins [Job]
getJob j = do 
    res <- get (job j `as` json -?- "tree" -=- "builds[duration,number,result,builtOn]")
    let jobs = res ^.. key "jobs"._Array.each.key "name"._String
    concurrentlys (map (\n -> do return $ Job n 0 "" "") jobs)


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

