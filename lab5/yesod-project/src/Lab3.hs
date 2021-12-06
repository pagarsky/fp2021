

module Lab3 where
    import           Data.String.Conversions (cs)
    import qualified Data.Map as Map
    import           Data.Text           (Text)

    frequency :: Num k => Text -> [(Char, k)]
    frequency txt =
        Map.toList $ Map.fromListWith (+) [(c, 1) | c <- str]
        where
            str = cs txt :: String
