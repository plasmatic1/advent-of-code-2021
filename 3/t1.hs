import Data.Function
import Data.List
import Data.Bits
import Data.Char

count :: (Eq a) => [a] -> a -> Int
count [] k = 0
count (x:xs) k
    | x == k = 1 + count xs k
    | otherwise = count xs k

compose :: [Int] -> Int
compose [] = 0
compose (x:xs) = x + 2 * compose xs

main =
    do
        fileData <- readFile "in"
        let nums = transpose $ lines fileData
        let n = length nums

        let gamma = compose $ reverse $ map (\row -> if count row '1' >= count row '0' then 1 else 0) nums
        let epsilon = gamma `xor` (2 ^ n - 1)

        print $ gamma * epsilon
        -- print nums
        -- print $ count (nums !! 0) '1'
        -- print $ count (nums !! 0) '0'
        -- print gamma
        -- print epsilon
