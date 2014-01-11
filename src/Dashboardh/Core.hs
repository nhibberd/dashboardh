{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.Core(Hole(..)) where

import Dashboardh.Prelude
import Dashboardh.Job
import Data.Text                (Text)
import           Control.Lens                      -- lens
import           Control.Lens.Aeson                -- lens-aeson
import qualified Data.ByteString.Char8 as B
import qualified Data.Text.IO as T
import           Jenkins.REST hiding (render)
import           System.Exit (exitFailure)
import Options.Applicative

data Hole = Hole

foo :: Int -> Int
foo a = a

jobz :: Text -> Job
jobz =
    error("todo")
