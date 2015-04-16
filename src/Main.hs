{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Config.Conf

main :: IO ()
--main :: IO () - че за тип IO, почему без стрелки?
main = do
  config <- load configFiles
  -- почему мы можем использоватать load, а не C.load?

  httpConf <- httpConfig config

  -- откуда взялся hcPort? или это вызов метода?
  scotty(hcPort httpConf) $
    get "/" $ text "hello world!"