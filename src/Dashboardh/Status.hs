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
