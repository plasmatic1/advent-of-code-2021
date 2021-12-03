import Data.List
import Data.Char

count :: (Eq a) => [a] -> a -> Int
count [] k = 0
count (x:xs) k
    | x == k = 1 + count xs k
    | otherwise = count xs k

compose :: [Int] -> Int
compose [] = 0
compose (x:xs) = x + 2 * compose xs

bxor :: Bool -> Bool -> Bool
bxor a b = (a || b) && not (a && b)

getList :: [String] -> Bool -> [Int]
getList rows inv =
    case length rows of
        1 -> map digitToInt (head rows)
        _ -> let fbit = map head rows
                 (f0, f1) = partition ((== '0') . head) rows
                 in if (count fbit '1' >= count fbit '0') `bxor` inv
                    then 1 : getList (map tail f1) inv
                    else 0 : getList (map tail f0) inv

main =
    do
        fileData <- readFile "in"
        let nums = lines fileData
        let oxy = compose $ reverse $ getList nums True
        let co2 = compose $ reverse $ getList nums False

        -- print nums
        -- print $ getList nums True
        print $ oxy * co2
        -- print oxy
        -- print co2
