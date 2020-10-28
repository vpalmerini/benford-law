-- Projeto 1
-- Victor Palmerini - 178061

import Data.Char (isDigit)
import Data.Map (fromList)
import Data.Maybe (fromJust, isNothing)

split :: String -> [String]
split [] = [""]
split (c:cs)
   | c == ' '  = "" : rest
   | otherwise = (c : head rest) : tail rest
    where rest = split cs

isDigit' c
    | c == '0' = False
    | otherwise = isDigit c

getFirstDigit [] = Nothing
getFirstDigit (c:cs)
    | isDigit' c = Just c
    | otherwise = getFirstDigit cs

updateMap key ((k,v):xs)
    | key == k = (k, v + 1):xs
    | otherwise = (k,v):(updateMap key xs)

main = do
        string <- getContents
        putStrLn $ show $ benford $ split string