{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import           Control.Applicative ((<$>), (<*>))
import           Data.Text           (Text, reverse)
import           Yesod
import           Yesod.Form.Jquery


data App = App

mkYesod "App" [parseRoutes|
/ HomeR GET
/vlad VladR GET POST
-- /alex AlexR GET POST
|]

instance Yesod App

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

newtype StrWrapper = StrWrapper
    {
        text :: Text
    }
    deriving Show


stringAForm :: Html -> MForm Handler (FormResult StrWrapper, Widget)
stringAForm = renderDivs $ StrWrapper <$> areq textField "text" Nothing


getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|<h1>This is simple|]


getVladR :: Handler Html
getVladR = do
    (widget, enctype) <- generateFormPost stringAForm
    defaultLayout [whamlet|
        <form method=post action=@{VladR} enctype=#{enctype}>
            ^{widget}
            <button>Submit
    |]


postVladR :: Handler Html
postVladR = do
    ((result, widget), enctype) <- runFormPost stringAForm
    case result of
        FormSuccess str -> defaultLayout [whamlet|<p>#{Data.Text.reverse $ text str}|]
        _ -> defaultLayout [whamlet|<p>Something went wrong|]

-- getAlexR
-- postAlexR

main :: IO ()
main = warp 3000 App