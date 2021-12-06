{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import           Control.Applicative ((<$>), (<*>))
import           Data.Text           (Text, reverse)
import           Yesod
import           Yesod.Form.Jquery

import Lab3


data App = App

mkYesod "App" [parseRoutes|
/ HomeR GET
/vlad VladR GET POST
/alex AlexR GET POST
|]

instance Yesod App

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

newtype StrWrapper = StrWrapper
    {
        text :: Text
    }
    deriving Show


makeFormLayout act enc widget = do
    addStylesheetRemote "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
    [whamlet|
        <div style="text-align: center; margin: 0; position: absolute; top: 50%; left: 50%; -ms-transform: translate(-50%, -50%); transform: translate(-50%, -50%);">
            <form method=post action=@{act} enctype=#{enc}>
                ^{widget}
                <button type="submit" class="btn btn-primary">Submit
        <div>
    |]

makeResultLayout res = do
    setTitle "Result"
    [whamlet|
        <div style="text-align: center; margin: 0; position: absolute; top: 50%; left: 50%; -ms-transform: translate(-50%, -50%); transform: translate(-50%, -50%);">
            <h3>#{res}
            <a href=@{HomeR}>Home<a>
        <div>
    |]


stringAForm :: Html -> MForm Handler (FormResult StrWrapper, Widget)
stringAForm = renderDivs $ StrWrapper <$> areq textField "text" Nothing


getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    [whamlet|<h1>Additional task for lab5|]
    [whamlet|<h4><a href=@{VladR}>Kuznetsov<a>|]
    [whamlet|<h4><a href=@{AlexR}>Pagarsky<a>|]


getVladR :: Handler Html
getVladR = do
    (widget, enctype) <- generateFormPost stringAForm
    defaultLayout $ do
        setTitle "Reverse"
        makeFormLayout VladR enctype widget


postVladR :: Handler Html
postVladR = do
    ((result, widget), enctype) <- runFormPost stringAForm
    case result of
        FormSuccess str -> defaultLayout $ do
            makeResultLayout $ Data.Text.reverse $ text str
        _ -> defaultLayout [whamlet|<p>Something went wrong|]


getAlexR :: Handler Html
getAlexR = do
    (widget, enctype) <- generateFormPost stringAForm
    defaultLayout $ do
        setTitle "Frequency"
        makeFormLayout AlexR enctype widget


postAlexR :: Handler Html
postAlexR = do
    ((result, widget), enctype) <- runFormPost stringAForm
    case result of
        FormSuccess str -> defaultLayout $ do
            makeResultLayout $ show $ Lab3.frequency $ text str
        _ -> defaultLayout [whamlet|<p>Something went wrong|]


main :: IO ()
main = warp 3000 App
