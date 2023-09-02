import Debug.Trace

vToBool :: Char -> Bool
vToBool x = if x == '_'
 then False
 else True

toBool :: String -> [Bool]
toBool [] = []
toBool (x:xs) = vToBool x : toBool (xs)

bToVis :: Bool -> Char
bToVis x = if x
 then '-'
 else '_'

toVis :: [Bool] -> String
toVis [] = []
toVis (x:xs) = bToVis x : toVis (xs)

{-
[["A","__---___---___---___---___"],["B","____---___---___---___---_"]]
[["C","AND","A","B"],["D","OR","A","B"],["E","XOR","A","B"]]
C ____-_____-_____-_____-___
D __-----_-----_-----_-----_
E __--_--_--_--_--_--_--_--_
-}
td1 = "__---___---___---___---___"
td2 = "____---___---___---___---_"
cd1 = "____-_____-_____-_____-___"
cd2 = "__-----_-----_-----_-----_"
cd3 = "__--_--_--_--_--_--_--_--_"
din = [inA, inB]
inA = ["A", td1]
inB = ["B", td2]

-- (toVis $ zipWith (!!) (toBool td1) (toBool td2))

doOpAnd :: [Bool] -> [Bool] -> [Bool]
doOpAnd x y = zipWith (&&) x y

doOpOr :: [Bool] -> [Bool] -> [Bool]
doOpOr x y = zipWith (||) x y

doOpXOr :: [Bool] -> [Bool] -> [Bool]
doOpXOr x y = zipWith (/=) x y

doOpNAnd :: [Bool] -> [Bool] -> [Bool]
doOpNAnd x y = zipWith (nand) x y
  where nand x y = not ((&&) x y)

doOpNOr :: [Bool] -> [Bool] -> [Bool]
doOpNOr x y = zipWith (nor) x y
  where nor x y = not ((||) x y)

doOpNXOr :: [Bool] -> [Bool] -> [Bool]
doOpNXOr x y = zipWith (nxor) x y
  where nxor x y = not ((/=) x y)

matchOp :: String -> [Bool] -> [Bool] -> [Bool]
matchOp op = case op of
  "AND" -> doOpAnd
  "OR" -> doOpOr
  "XOR" -> doOpXOr
  "NAND" -> doOpNAnd
  "NOR" -> doOpNOr
  "NXOR" -> doOpNXOr

mapInNm :: [[String]] -> String -> String
mapInNm [] _ = []
mapInNm (x:xs) s 
  | s == x!!0 = x!!1
  | otherwise = mapInNm xs s

mpOut :: [[String]]-> [String] -> (String, String, [Bool], [Bool])
mpOut inp out = (out!!0, out!!1, toBool (mapInNm inp (out!!2)), toBool (mapInNm inp (out!!3)))

mpOp :: (String, String, [Bool], [Bool]) -> (String, String)
mpOp (outName, op, op1, op2) = (outName, toVis (doOp op1 op2))
  where doOp = matchOp op

main :: IO ()
main = do
  let din = [["A","__---___---___---___---___"],["B","____---___---___---___---_"]]
  let drq = [["C","AND","A","B"],["D","OR","A","B"],["E","XOR","A","B"]]

  let s1 = map (mpOp . mpOut din) $ drq
  print $ s1

  print $ "bye!"
