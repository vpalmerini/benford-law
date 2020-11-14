import Data.Char (isDigit)
import Data.Maybe (fromJust, isNothing)
import Numeric

formatFloatN floatNum numOfDecimals = showFFloat (Just numOfDecimals) floatNum ""

split :: String -> [String]
split [] = [""]
split (c:cs)
   | (c == ' ' || c == '\n')  = "" : rest
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

countDict [] = 0
countDict ((k,v):xs) = countDict' ((k,v):xs) 0
    where
        countDict' [] acc = acc
        countDict' ((k,v):xs) acc = countDict' xs (v + acc)

parseDict [] _ = []
parseDict ((k,v):xs) n = (k, (formatFloatN (v / n) 2)) : (parseDict xs n)

benford [] dict = dict
benford (a:as) dict
    | isNothing (getFirstDigit a) = benford as dict
    | otherwise = benford as (updateMap (fromJust (getFirstDigit a)) dict)

main = do
        string <- getContents
        let dict = [('1', 0), ('2', 0), ('3', 0), ('4', 0), ('5', 0), ('6', 0), ('7', 0), ('8', 0), ('9', 0)]
        let freq = benford (split string) dict
        putStrLn $ show $ parseDict freq (countDict freq)
