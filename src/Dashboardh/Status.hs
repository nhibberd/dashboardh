{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.Status where

import Dashboardh.Prelude
import Data.Aeson
import Data.Text

data Foo = Foo 
    { name :: Text
    , age  :: Int
    } deriving (Eq, Show)

instance FromJSON Foo where
    parseJSON (Object v) = Foo <$>
                           v .: "name" <*>
                           v .: "age"
    parseJSON _          = mzero
instance ToJSON Foo where
    toJSON (Foo name age) = object ["name" .= name, "age" .= age]

foo :: Int -> Int
foo a = a