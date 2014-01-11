{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.BuildTime ( BuildTime(..), FromJSON, ToJSON ) where

import Dashboardh.Prelude
import Data.Aeson
import Data.Text

data BuildTime = BuildTime
    { name :: Text
    , builds  :: Int
    , avgTime  :: Int
    } deriving (Eq, Show)

instance FromJSON BuildTime where
    parseJSON (Object v) = BuildTime <$>
                           v .: "name" <*>
                           v .: "builds" <*>
                           v .: "avgTime" 
    parseJSON _          = mzero
instance ToJSON BuildTime where
    toJSON (BuildTime n b a) = object ["name" .= n, "builds" .= b, "avgTime" .= a]
