{-# LANGUAGE OverloadedStrings #-}
module Dashboardh.Core where

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

foo :: Int -> Int
foo a = a

jobz :: Text -> Job
jobz =
    error("todo")



options :: ParserInfo Settings
options = info (helper <*> parser) fullDesc
 where
  parser = Settings
    <$> (Host <$> strOption (long "http://aubne-s-dvl01b.ventyx.abb.com"))
    <*> (Port <$> option (long "8080"))
    <*> (User . B.pack <$> strOption (long "anonymous"))
    <*> (APIToken . B.pack <$> strOption (long "secret"))