{-# LANGUAGE OverloadedStrings, TemplateHaskell, DeriveGeneric, ScopedTypeVariables #-}
module Dashboardh.Status(
   getJenkins
 , getJobs
 , getViewJobs
 , getJob
 , getAvgBuildTime
 ) where

import Dashboardh.Prelude
import Dashboardh.Job
import Dashboardh.BuildTime
import Dashboardh.Core
import Data.Text                (Text)
import Data.List                
import Options.Applicative
import Control.Lens             hiding (view)
import Control.Lens.Aeson
import Jenkins.REST
import Debug.Trace

getJenkins :: Jenkins [a] -> IO [a]
getJenkins f = do
  let opts = Settings "http://localhost" 8090 "" ""
  jobs <- runJenkins opts f
  case jobs of
      Right l -> return l
      Left  _ -> return []

getJobs :: Jenkins [Text]
getJobs = do
  res <- get (json -?- "tree" -=- "jobs[name]")
  let jobs = (trace (show res) res)  ^.. key "jobs"._Array.each.key "name"._String
  concurrentlys (map (\n -> do return $ n) jobs)

getViewJobs :: Text -> Jenkins [Text]
getViewJobs v = do
  res <- get (view v `as` json -?- "tree" -=- "jobs[name]")
  let jobs = res ^.. key "jobs"._Array.each.key "name"._String
  concurrentlys (map (\n -> do return $ n) jobs)

getJob :: Text -> Jenkins [Job]
getJob j = do 
    res <- get (job j `as` json -?- "tree" -=- "builds[duration,result,builtOn]")
    let dur = res ^.. key "builds"._Array.each.key "duration"._Integer
    let bOn = res ^.. key "builds"._Array.each.key "builtOn"._String
    let rlt = res ^.. key "builds"._Array.each.key "result"._String
    concurrentlys (zipWith3 (\a -> \b -> \c -> do return $ Job j (fromInteger a) b c) dur rlt bOn )

getAvgBuildTime :: Text -> Jenkins [BuildTime]
getAvgBuildTime j = do
    res <- get (job j `as` json -?- "tree" -=- "builds[duration]")
    let dur = res ^.. key "builds"._Array.each.key "duration"._Integer
    concurrentlys (return . return $ BuildTime j (length dur) . avg $ map fromInteger dur)


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

