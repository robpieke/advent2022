import qualified Data.Map
import Data.Maybe

fromSnafuMap = Data.Map.fromList[('=', -2), ('-', -1), ('0', 0), ('1', 1), ('2', 2)]

fromSnafuDigit :: Char -> Int
fromSnafuDigit c = fromJust $ Data.Map.lookup c fromSnafuMap

fromSnafuStr :: String -> Int
fromSnafuStr s = foldl (\x y -> x * 5 + y) 0 $ map (\c -> fromSnafuDigit c) s

toSnafuCharLst = ["0", "1", "2", "=", "-"]
toSnafuIncLst = [0, 0, 0, 1, 1]

toSnafuStr :: Int -> String
toSnafuStr 0 = ""
toSnafuStr i = toSnafuStr (div i 5 + toSnafuIncLst !! (mod i 5)) ++ toSnafuCharLst !! (mod i 5)

solve :: [String] -> String
solve sl = toSnafuStr . sum $ map (\s -> fromSnafuStr s) sl

main = do 
    file <- readFile("input.txt")
    print $ solve (lines file)
