{-# LANGUAGE OverloadedStrings, ScopedTypeVariables #-}

module Http.Routes
    (routes)
where

import Data
import Web.Scotty
import Data.Monoid ((<>))

routes :: ScottyM()
routes = do
    get "/test" $ do
        name <- param "name"
        text $ "hello " <> name

    post "/create" $ do
        itemJson :: Item <- jsonData
        json itemJson