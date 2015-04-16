{-# LANGUAGE OverloadedStrings #-}

module Config.Conf
    ( AppConfig(..)
    , Environment(..)
    , configFiles
    , appConfig
    , C.load
    )
where
-- в скобках экспорт для дальнейшей работы с модулем? зачем конструкция (..)?

import qualified Data.Configurator as C
import qualified Data.Configurator.Types as CT

type Port = Int
data Environment = Development | Other
data AppConfig = AppConfig { hcPort :: Port
                            , hcEnvironment :: Environment}

-- в чем разница между data и type?

configFiles :: [C.Worth FilePath]
configFiles = [C.Required "config/config.cfg"]

appConfig :: CT.Config -> IO AppConfig
appConfig c = do
    let config = C.subconfig "http" c
    port <- C.require config "port"
    appEnv <- C.require c "environment"
    return $ AppConfig port (getEnvirinment appEnv)

getEnvirinment :: String -> Environment
getEnvirinment env = case env of
                        "development" -> Development
                        _ -> Other

-- зачем return?