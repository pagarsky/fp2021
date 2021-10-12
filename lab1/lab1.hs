module Lab1 where

    -- Number 7 in list


    ----------------------------
    -- Task 1

    -- > :t ("Something", ([True, False], [1, 2, 3]))
    -- ("Something", ([True, False], [1, 2, 3]))
    -- :: Num a => ([Char], ([Bool], [a]))

    -- > :t ("Something"::String, ([True, False], [1, 2, 3]::[Integer]))
    -- ("Something"::String, ([True, False], [1, 2, 3]::[Integer]))
    -- :: (String, ([Bool], [Integer]))



    ----------------------------
    -- Task 2

    ord' :: Ord a => a -> a -> Bool
    ord' x y = x <= y

    -- > ord' 13 15
    -- True
    -- > ord' 13e13 15
    -- False
    -- > ord' 2.0 pi
    -- True
