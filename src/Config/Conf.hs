{-# LANGUAGE OverloadedStrings #-}

module Config.Conf
    ( HttpConfig(..)
    , configFiles
    , httpConfig
    , C.load
    )
where
-- в скобках экспорт для дальнейшей работы с модулем? зачем конструкция (..)?

import qualified Data.Configurator as C
import qualified Data.Configurator.Types as CT

type Port = Int
data HttpConfig = HttpConfig { hcPort :: Port}
-- {::} - что за запись?

configFiles :: [C.Worth FilePath]
configFiles = [C.Required "config/config.cfg"]

httpConfig :: CT.Config -> IO HttpConfig
httpConfig c = do
    let config = C.subconfig "http" c
    port <- C.require config "port"
    return $ HttpConfig port

-- зачем return?