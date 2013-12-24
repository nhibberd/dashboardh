module Dashboardh.Prelude (
  module X
) where

import Prelude as X (Int, Char, String, Eq, Ord, Show (..), IO, ($), id, putStrLn, (.), error)
import Control.Applicative as X ((<$>), (<*>), (*>), (<*), pure)
import Control.Monad.Trans as X (liftIO)
import Control.Monad as X (mzero)