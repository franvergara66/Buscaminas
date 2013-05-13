buscaminas :: Int -> Int -> [(Int, Int)] -> [[Int]]
buscaminas f c l = colocarminas(iniciarmar f c (nub l))(nub l)

nub:: (Eq a) => [a] -> [a]
nub = nubBy (==)
 
nubBy:: (a -> a -> Bool) -> [a] -> [a]
nubBy eq [] = []
nubBy eq (x:xs) = x : nubBy eq (filter (\y -> not (eq x y)) xs)

iniciarmar f c l = armar f c (inicializar f c) l

inicializar :: Int -> Int -> [[Int]] 
inicializar f c = matrizero f c

matrizero :: Int -> Int -> [[Int]] -- Esta funcion genera una matriz llena de ceros de las dimensiones del problema
matrizero 0 _ = []
matrizero f c = crealistazero c : matrizero (f-1) c

crealistazero :: Int -> [Int]
crealistazero 0 = []
crealistazero c = 0 : crealistazero (c-1)

armar _ _ r [] = r
armar f c r (l:ls) = armar f c (pares r (sumar2 f c l)) ls

sumar2 :: Int -> Int -> (Int, Int) -> [(Int, Int)]
sumar2 f c (x,y) = map (sumar3 f c (x,y)) lista
	where lista = [(-1,-1),(-1,0),(0,-1),(1,1),(1,0),(0,1),(-1,1),(1,-1)]
	
sumar3 :: Int -> Int -> (Int, Int) -> (Int, Int) -> (Int, Int)
sumar3 f c (x,y) (a,b) 	| x+a <= f && y+b <= c && x+a > 0 && y+b > 0 = (x+a,y+b)
						| x+a > f || y+b > c || x+a <= 0 || y+b <= 0 = (x,y)

pares r [] = r
pares r (l:ls) = pares(funcion r l) ls

funcion (r:rs) (x,y) 	| (x-1) > 0 = r : funcion rs (z,y)
						| (x-1) == 0 = (funcion2 r y) : rs
				where z = x-1

funcion2 (r:rs) y 	| (y-1) > 0 = r : funcion2 rs (y-1)
					| (y-1) == 0 = r+1 : rs


colocarminas :: [[Int]] -> [(Int, Int)] -> [[Int]]
colocarminas r [] = r
colocarminas r (l:ls) = colocarminas (minas1 r l) ls 

minas1 (r:rs) (x,y) 	| (x-1) > 0 = r : minas1 rs (z,y)
						| (x-1) == 0 = (minas2 r y) : rs
				where z = x-1
						
minas2 (r:rs) y 	| (y-1) > 0 = r : minas2 rs (y-1)
					| (y-1) == 0 = -1 : rs