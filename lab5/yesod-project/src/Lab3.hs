

module Lab3 where
    import qualified Data.Map as Map

    frequency :: (Ord ch, Num k) => [ch] -> [(ch, k)]
    frequency str = Map.toList $ Map.fromListWith (+) [(c, 1) | c <- str]
