-- Projeto 1
-- Victor Palmerini - 178061

import Data.Char (isDigit)
import Data.Map (fromList)

split :: String -> [String]
split [] = [""]
split (c:cs)
   | c == ' '  = "" : rest
   | otherwise = (c : head rest) : tail rest
    where rest = split cs

isDigit' c
    | c == '0' = False
    | otherwise = isDigit c

main = do
        string <- getContents
        putStrLn $ show $ split string