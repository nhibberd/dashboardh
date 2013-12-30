{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.Job ( Job(..), FromJSON, ToJSON ) where

import Dashboardh.Prelude
import Data.Aeson
import Data.Text

data Job = Job 
    { name :: Text
    , duration  :: Int
    , result  :: Text
    , builtOn  :: Text
    } deriving (Eq, Show)

instance FromJSON Job where
    parseJSON (Object v) = Job <$>
                           v .: "name" <*>
                           v .: "duration" <*>
                           v .: "result" <*>
                           v .: "builtOn"
    parseJSON _          = mzero
instance ToJSON Job where
    toJSON (Job n d r b) = object ["name" .= n, "duration" .= d, "result" .= r, "builtOn" .= b]
