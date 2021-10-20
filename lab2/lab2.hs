
-- Лабораторна робота №2
    -- Студента групи КН-31 підгрупа 2
    -- Пагарського Олексія
    -- Варіант №7

    -- Мета: Набути досвiду визначення рекурсивних функцiй,
    -- використання механiзму зiставлення зi зразком i роботи з кортежами та списками.

module Lab2 where

    ----------------------------
    -- Task 1
    -- Послiдовнiсть тотожних елементiв списку замiнити одним елементом,
    -- напр.: [1,1,1,5,5,3,1,1,222,222,222,222] ⇒ [1,5,3,1,222].

    -- З застосуванням вбудованих функцій:
    unique_cons :: Eq a => [a] -> [a]
    unique_cons xs
        | null xs                       = []
        | length xs == 1                = xs
        | (head xs) /= head(tail xs)    = (head xs) : unique_cons(tail xs)
        | otherwise                     = unique_cons(tail xs)

    -- Без застосування вбудованих функцій:
    unique_cons2 xs
        | length xs == 0                = []
        | length xs == 1                = xs
        | (_head xs) /= _head(_tail xs) = (_head xs) : unique_cons(_tail xs)
        | otherwise                     = unique_cons(_tail xs)
        where
            _head = (\(x:_) -> x)
            _tail = (\(_:x) -> x)

    -- Тестування:
    -- Prelude> :load lab2/lab2.hs 
    -- [1 of 1] Compiling Lab2             ( lab2/lab2.hs, interpreted )
    -- Ok, one module loaded.
    -- *Lab2> unique_cons [1,1,1,5,5,3,1,1,222,222,222,222]
    -- [1,5,3,1,222]
    -- *Lab2> unique_cons [1, 1, 2, 2, 2, 5, 5, 2, 2]
    -- [1,2,5,2]
    -- *Lab2> unique_cons [11, 2, 2, 2, 222, 222, 222, 15, 15, 5, 5]
    -- [11,2,222,15,5]
    -- *Lab2> unique_cons []
    -- []


    ----------------------------
    -- Task 2
    -- Визначити, чи два числа взаємно простi.

    -- З застосуванням вбудованих функцій:
    coprime :: Integral a => a -> a -> Bool
    coprime a b = gcd a b == 1

    -- Без застосування вбудованих функцій:
    _gcd 0 b = b
    _gcd a b = _gcd (mod b a) a

    coprime2 :: Integral a => a -> a -> Bool
    coprime2 a b = _gcd a b == 1

    -- Тестування:
    -- Prelude> :load lab2/lab2.hs 
    -- [1 of 1] Compiling Lab2             ( lab2/lab2.hs, interpreted )
    -- Ok, one module loaded.
    -- *Lab2> coprime 25 32
    -- True
    -- *Lab2> coprime 5 15
    -- False
    -- *Lab2> coprime 7 49
    -- False


    -- Висновок:
    -- В результаті виконання лабораторної роботи було створено два
    -- варіанти для двох функцій (з використанням вбудованих функцій, та без)
    -- відповідно з заданим варіантом роботи.
    -- Це дозволило закріпити знання та набути практичних навичок
    -- по використанню pattern matching, lambda functions та guards 
    -- функціональної мови програмування haskell.
