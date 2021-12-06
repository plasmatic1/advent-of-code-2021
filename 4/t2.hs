import Data.Function
import Data.List
import Data.Char
import Data.Text (unpack, pack, splitOn, strip)
import Text.Regex

split c s = map unpack $ Data.Text.splitOn (pack c) $ pack s
strip' = unpack . strip . pack

chunksOf n [] = []
chunksOf n xs = take n xs : chunksOf n (drop n xs)

count :: (Eq a) => [a] -> a -> Int
count [] k = 0
count (x:xs) k
    | x == k = 1 + count xs k
    | otherwise = count xs k

readInt x = read x :: Int

processBoard :: [String] -> [[Int]]
processBoard = map (map readInt . filter (not . null) . split " ")

indexOrInf l a =
    case elemIndex a l of
        Just i -> i
        Nothing -> 1000000000

winRow [] nums = 1000000000
winRow (row:rest) nums = min (maximum $ map (indexOrInf nums) row) (winRow rest nums)

winCol board = winRow (transpose board)

win board nums = min (winRow board nums) (winCol board nums)
win' = flip win  -- For mapping stuff

sumNotContain [] nums = 0
sumNotContain (x:xs) nums
    | x `elem` nums = sumNotContain xs nums
    | otherwise = x + sumNotContain xs nums

main =
    do
        fileData <- readFile "in"
        let (order:bingo) = lines fileData
            boards = map (processBoard . tail) (chunksOf 6 bingo)
            nums = map readInt $ split "," order
            winTime = maximum $ map (win' nums) boards
            winBoard = find (( == winTime) . win' nums) boards
        
        case winBoard of
            Just winb -> 
                let unmarked = sumNotContain (concat winb) (take (winTime + 1) nums)
                    final = nums !! winTime
                    in print $ unmarked * final 
            Nothing ->
                print "No winning board? Error"