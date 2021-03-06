import           Language.Fay.FFI
import           Language.Fay.Prelude

main = putStrLn (showList (take 5 (let ns = 1 : map' (foo 123) ns in ns)))

foo x y = x * y / 2

take 0 _      = []
take n (x:xs) = x : take (n - 1) xs

map' f []     = []
map' f (x:xs) = f x : map' f xs

showList :: [Double] -> String
showList = ffi "JSON.stringify(%1)"
