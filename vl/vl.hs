lyCond1 :: Int -> Bool
lyCond1 year = mod year 4 == 0

lyCond2 :: Int -> Bool
lyCond2 year = not (mod year 100 == 0)

lyCond3 :: Int -> Bool
lyCond3 year = mod year 400 == 0

isLeapYear :: Int -> Bool
isLeapYear year =
 if lyCond3 year || (lyCond1 year && lyCond2 year)
  then True
  else False

main :: IO ()
main = do
  let years_list = [2000, 2400, 1800, 1900, 2100, 2200, 2300, 2500]
  print $ map isLeapYear years_list


--firstMaxPos xs = head $ filter ((== maximum xs) . (xs !!)) [0..]
