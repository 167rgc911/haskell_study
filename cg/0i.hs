findMaxPos xs = head $ filter ((== maximum xs) . (xs !!)) [0..]

let f = snd $ maximum $ zip d ((take (length d)) [0..])
let f = snd . maximum $ zip d ((take (length d)) [0..])
