
-- Лабораторна робота №5
    -- Студента групи КН-31 підгрупа 2
    -- Пагарського Олексія
    -- Варіант №7

    -- Мета: Ознайомитись з модульною органiзацiєю програм та засобами введення-виведення.
    -- Набути досвiду компiляцiї Haskell-програм.

module Main where -- if I name this Lab5 it messes up compilation
    import Prelude
    import System.IO
    import Lab3
    
    ----------------------------
    -- 5.2.1. Реалiзувати та скомпiлювати одну з програм,
    -- розроблених у лабораторнiй роботi No 3 для Вашого варiанта з введенням даних:
    -- та виведенням результатiв:
    -- а) з клавiатури,
    -- б) з файлу,
    -- в) на екран,
    -- г) у файл.
    
    main = do
        putStrLn "frequency function does this: \"aaabbcaadddd\" ⇒ [(’a’,5), (’b’,2), (’c’,1), (’d’,4)]"
        putStrLn "Input string to use in it:"
        -- з клавіатури
        lstStr <- getLine
        -- на екран
        putStrLn ("Result is: " ++ show(frequency lstStr))

        -- з файлу
        input <- openFile "input.txt" ReadMode
        contents <- hGetContents input
        let result = frequency contents
        -- у файл
        withFile "output.txt" WriteMode (\handle -> do
            hPutStrLn handle $ show result
            hClose handle
            )


    -- Тестування:
    -- $ ghc Main.hs
    -- [1 of 2] Compiling Lab3             ( Lab3.hs, Lab3.o )
    -- [2 of 2] Compiling Main             ( Main.hs, Main.o )
    -- Linking Main ...
    -- $ ./Main         -- або Main.exe для Windows систем
    -- frequency function does this: "aaabbcaadddd" ⇒ [(’a’,5), (’b’,2), (’c’,1), (’d’,4)]
    -- Input string to use in it:
    -- jshkgbeklagbaeklgblaekgbaerlgaekjghbejklrg
    -- Result is: [('a',5),('b',5),('e',6),('g',7),('h',2),('j',3),('k',6),('l',5),('r',2),('s',1)]


    -- Висновок:
    -- В результаті виконання лабораторної роботи було
    -- опрацьовано та набуто навичок по роботі з модульною структурою
    -- програм та засобами вводу виводу функціональної мови програмування Haskell.