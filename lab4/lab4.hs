
-- Лабораторна робота №4
    -- Студента групи КН-31 підгрупа 2
    -- Пагарського Олексія
    -- Варіант №7

    -- Мета: Ознайомитись з системою типiв та класiв типiв.
    -- Набути досвiду визначення нових типiв та класiв типiв i їх використання.

module Lab4 where
    ----------------------------
    -- Публiкацiї. Зберiгаються данi про публiкацiї, якi можуть бути
    -- книгою (автор/спiвавтори, назва, мiсто, видавництво, рiк),
    -- статтею (автор/спiвавтори, назва статтi, назва журналу, рiк, номер журналу, сторiнки) або
    -- тезами доповiдi (автор/спiвавтори, назва доповiдi, назва конференцiї, мiсто, рiк, сторiнки).
    
    import Data.List

    type Authors = [String]
    type Title = String
    type City = String
    type Publisher = String
    type Year = Int
    type Journal_Title = String
    type Number = Int
    type Pages = Int
    type Conf_Title = String

    data Publication =
        Book Authors Title City Publisher Year                  |
        Article Authors Title Journal_Title Year Number Pages   |
        Theses Authors Title Conf_Title City Year Pages
        deriving (Show, Eq)

    class Searchable s where
        getAuthors :: s -> Authors
    
    instance Searchable Publication where
        getAuthors (Book a _ _ _ _) = a
        getAuthors (Article a _ _ _ _ _) = a
        getAuthors (Theses a _ _ _ _ _) = a


    -- Визначне функцiї для:
    -- пошуку усiх статей (книг, тез) вказаного автора;
    publications_by author pubs = filter (elem author . getAuthors) pubs


    -- Тестування:
    -- *Lab4> :load lab4/lab4.hs 
    -- [1 of 1] Compiling Lab4             ( lab4/lab4.hs, interpreted )
    -- Ok, one module loaded.
    -- *Lab4> b = Book ["Someone"] "Something" "Somewhere" "By_Someone" 1994
    -- *Lab4> b2 = Book ["Someone2"] "Something" "Somewhere" "By_Someone" 1995
    -- *Lab4> a = Article ["Someone", "Not_Someone"] "Something" "Some_Journal" 1995 6 202
    -- *Lab4> a2 = Article ["Someone2"] "Something" "Some_Journal" 2004 9 25
    -- *Lab4> t = Theses ["Someone", "Someone2"] "Something Theses" "Something_Conf" "Somewhere" 2004 9
    -- *Lab4> t2 = Theses ["Someone", "Someone2"] "Something Theses" "Something_Conf" "Somewhere" 2004 9
    -- *Lab4> publications_by "Someone2" [b, b2, a, a2, t, t2]
    -- [Book ["Someone2"] "Something" "Somewhere" "By_Someone" 1995,Article ["Someone2"] "Something" "Some_Journal" 2004 9 25,Theses ["Someone","Someone2"] "Something Theses" "Something_Conf" "Somewhere" 2004 9,Theses ["Someone","Someone2"] "Something Theses" "Something_Conf" "Somewhere" 2004 9]
    


    -- Висновок:
    -- В результаті виконання лабораторної роботи було
    -- опрацьовано та набуто навичок по роботі та використанню
    -- системи типів та класів типів
    -- функціональної мови програмування Haskell.