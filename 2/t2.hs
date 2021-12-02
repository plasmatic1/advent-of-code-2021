import Data.Text (pack, unpack, splitOn)
import Data.Function

coord :: [([Char], Int)] -> Int -> Int -> Int -> Int
coord [] x y _ = x * y
coord ((a, b):xs) x y aim
    | a == "forward" = coord xs (x + b) (y + aim * b) aim
    | a == "down" = coord xs x y (aim + b)
    | otherwise = coord xs x y (aim - b)

splitSpace :: String -> [String]
splitSpace = map unpack . splitOn (pack " ") . pack

main =
    do
        fileData <- readFile "in"
        let ins = map ((\[a, b] -> (a, read b :: Int)) . splitSpace) (lines fileData)
            in print $ coord ins 0 0 0
