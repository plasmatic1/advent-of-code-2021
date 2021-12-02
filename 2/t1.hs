import Data.Text (pack, unpack, splitOn)
import Data.Function

-- prodT :: (Int, Int) -> Int
prodT (a, b) = a * b

-- sumV :: (Int, Int) -> (Int, Int) -> (Int, Int)
sumT (a, b) (c, d) = (a + c, b + d)

-- scaProd :: (Int, Int) -> Int -> Int
scaProd (a, b) c = (a * c, b * c)

dir :: [Char] -> (Int, Int)
dir "forward" = (1, 0)
dir "up" = (0, -1)
dir "down" = (0, 1)

coord :: [([Char], Int)] -> (Int, Int)
coord [] = (0, 0)
coord ((a, b):xs) = sumT (scaProd (dir a) b) (coord xs)

splitSpace :: String -> [String]
splitSpace = map unpack . splitOn (pack " ") . pack

main =
    do
        fileData <- readFile "in"
        let ins = map ((\[a, b] -> (a, read b :: Int)) . splitSpace) (lines fileData)
            in print $ prodT $ coord ins
