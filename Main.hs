{-
shotcurts:
std = static data declarations
MCE = Main code execution
-}

{-
-- chapter 23
{-# LANGUAGE MultiWayIf #-}

-- std
data Optional = NoSuchChapter
              | Chapter String

type Chapters = [(FilePath, String)]
chapters::Chapters
chapters= [ ("/list.html",  "Список") 
          , ("/tuple.html", "Кортеж") 
          , ("”/hof.html",  "ФВП")
          ]

-- data Maybe Text = Nothing | Just Text
lookupChapterNameBy::FilePath->Chapters-> Maybe String
lookupChapterNameBy _ [] = Nothing -- 404
lookupChapterNameBy path ((realPath, name):others)
  | path == realPath = Just name -- found
  | otherwise = lookupChapterNameBy path others

-- MCE
main :: IO ()
main = putStrLn $
  case result of
    NoSuchChapter -> "No such chapter, sorry..."
    Chapter name  -> "This is chapter name: " ++ name
  where
    name = lookupChapterNameBy "/tuple.html" chapters
-}

{-
-- chapter 21

-- std
data Patient = Patient { firstName
                       , lastName
                       , email::String
                       , age
                       , diseaseId::Int
                       , isIndoor
                       , hasInsurance::Bool
                      }
-- MCE
main::IO()
main = print $ email patientWithChangedEmail
  where
    patientWithChangedEmail = patient {
      email = "j.d@gmail.com"
    }
    
    patient      = Patient {
    firstName    = "John"
  , lastName     = "Doe"
  , email        = "john.doe@gmail.com"
  , age          = 24
  , diseaseId    = 431
  , isIndoor     = True
  , hasInsurance = True
  }

-}

{-
-- std
data IPAddress = IPv4 String
               | IPv4Localhost
               | IPv6 String
               | IPv6Localhost 
data EndPoint = IPAddress Int 
--let google = EndPoint (IPv4 "173.194.122.194") 80

-- MCE
main::IO()
main=putStrLn$ "The host is: "++ip
  where
  EndPoint (IPv4 ip) _ = (EndPoint.IPv4$ "173.194.122.194") 80
-}


{-
-- let google = IPv4 "173.194.122.194" 
checkIP::IPAddress->String
checkIP (IPv4 address) ="IP is "++address++"."
main::IO()
main=putStrLn.checkIP$ IPv4 "173.194.122.194" 
-}

{-
main::IO()
main =
  let cx = 2.0 / 6.054   -- thunk
      nk = 4.0 * 12.003  -- thunk
      coeffs = [cx, nk]  -- WHNF
  in print coeffs
-}

{-
-- std
import Data.Char
import Data.Text hiding (map, toUpper)

pretty::[String]->[String]
pretty=map(stars.big)
  where
  big = map toUpper
  stars = \s->"/"++s++"\\"

-- MCE
main::IO()
main=print.pretty$ ["haskell", "lisp", "coq"]
-}

{-
import Data.Char

toUpperCase::String->String
toUpperCase str = map toUpper str

main::IO()
main=putStrLn.toUpperCase$"haskell.org"
-}

{-
{-# LANGUAGE MultiWayIf #-}
module Main (main) where

-- std
analyzeGold :: Int -> String
analyzeGold 999 = "Wow! 999 standard!"
analyzeGold 750 = "Great! 750 standard."
analyzeGold 585 = "Not bad! 585 standard."
analyzeGold  _  = "I don’t know such a standard..."

-- MCE
main :: IO ()
main =  putStrLn (analyzeGold 750)
-}
