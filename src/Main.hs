{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Config.Conf
import Config.Logger

main :: IO ()
--main :: IO () - че за тип IO, почему без стрелки?
main = do
  config <- load configFiles
  -- почему мы можем использоватать load, а не C.load?

  appConf <- appConfig config

  -- откуда взялся hcPort? или это вызов метода?
  scotty(hcPort appConf) $ do
    middleware $ logger (hcEnvironment appConf)

    get "/test" $ do
      name <- param "name"
      text "hello " <> name