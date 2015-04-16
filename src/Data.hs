{-# LANGUAGE OverloadedStrings #-}

module Data
    ( Item(..)
    )
where

import Control.Monad (mzero)
import Data.Aeson
import qualified Data.Text as T

newtype Title = Title T.Text
newtype Completed = Completed Bool

data Item = Item Title Completed

instance FromJSON Item where
    parseJSON (Object o) = do
                            title <- o .: "title"
                            completed <- o .: "completed"
                            return $ Item (Title title) (Completed completed)
    parseJSON _ = mzero

    -- add fail there

instance ToJSON Item where
    toJSON (Item (Title title) (Completed completed)) =
        object["title" .= title, "completed" .= completed ]