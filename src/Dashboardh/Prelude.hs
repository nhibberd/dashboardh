module Dashboardh.Prelude (
  module X
) where

import Prelude as X (
      Int
    , Char
    , String
    , Eq
    , Ord
    , Show (..)
    , IO
    , ($)
    , id
    , putStrLn
    , (.)
    , error
    , Either( Right, Left )
    , undefined
    , return
    , map
    , (>>=)
    , (=<<)
    , foldr
    , fst
    , snd
    , zipWith
    , zipWith3
    , fromInteger
    , length
    , sum
    , realToFrac
    , div
    )
import Control.Applicative as X ((<$>), (<*>), (*>), (<*), pure)
import Control.Monad.Trans as X (liftIO)
import Control.Monad as X (mzero)