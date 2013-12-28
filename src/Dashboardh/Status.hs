{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.Status ( Job ) where

import Dashboardh.Prelude
import Data.Aeson
import Data.Text

data Job = Job 
    { name :: Text
    , buildTimeLatest  :: Int
    , buildTimeAvg  :: Int
    , buildTimeMin  :: Int
    , buildTimeMax  :: Int
    } deriving (Eq, Show)

instance FromJSON Job where
    parseJSON (Object v) = Job <$>
                           v .: "name" <*>
                           v .: "buildTimeLatest" <*>
                           v .: "buildTimeAvg" <*>
                           v .: "buildTimeMin" <*>
                           v .: "buildTimeMax"
    parseJSON _          = mzero
instance ToJSON Job where
    toJSON (Job n bl ba bmin bmax) = object ["name" .= n, "buildTimeLatest" .= bl, "buildTimeAvg" .= ba, "buildTimeMin" .= bmin, "buildTimeMax" .= bmax]


getSimpleJob :: Text -> Job
getSimpleJob =
    error("handle jenkins json")


getJobStatus :: Text -> Int
getJobStatus =
    error("return current build status")

-- Wrap following operations in Json call to jenkins

getJenkins :: Text
getJenkins =
    error("handle jenkins api")

getJobStatusHistory :: Text -> Int
getJobStatusHistory =
    error("return list of build status")    

getJobTimeHistory :: Text -> Int
getJobTimeHistory =
    error("return list of build times")    

