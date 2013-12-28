{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.Status ( getJenkins, getSimpleJob, getJobStatus, getJobStatusHistory, getJobTimeHistory ) where

import Dashboardh.Prelude
import Dashboardh.Job
import Data.Text

getJenkins :: Text
getJenkins =
    error("handle jenkins api")

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

