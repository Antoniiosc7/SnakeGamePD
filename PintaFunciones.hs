module PintaFunciones
    (pintaBloqueBorde,
    pintaCuadradoAzul,
    pintaCarcel3,
    pintaManzana,
    pintaSerpiente,
    pintaCuadrado,
    pintaBloqueInter,
    pintaNegro,
    pintaMarcador,
    pintaCarcelGanador
    ) where
      
import CodeWorld

type Punto = (Int, Int)
type BloqueInter = (Punto, Punto, Punto, Punto, Punto)

pintaManzana :: Punto -> Picture
pintaManzana (i, j) = (translated x y (colored red (solidCircle (0.3))))
  where x = fromIntegral i
        y = fromIntegral j

pintaSerpiente' :: [Punto] -> Picture
pintaSerpiente' [] = blank
pintaSerpiente' ((f,c):ps) = (translated x y (colored yellow (solidCircle (0.1))) & pintaCuadrado x y)   & pintaSerpiente ps
  where x = fromIntegral f
        y = fromIntegral c

pintaSerpiente :: [(Int, Int)] -> Picture
pintaSerpiente = foldr (\(f, c) acc -> translated (x f) (y c) (colored yellow (solidCircle 0.1)) & pintaCuadrado (x f) (y c) & acc) blank
  where
    x = fromIntegral
    y = fromIntegral


pintaMarcador :: [Punto] -> Int -> Picture
pintaMarcador _ 0 = blank 
pintaMarcador ((f,c):ps) n = (translated x y (colored red (solidCircle (0.1))) & pintaRojo x y)   & pintaMarcador ps (n-1)
  where x = fromIntegral f
        y = fromIntegral c

pintaRojo :: Double -> Double -> Picture
pintaRojo x y = translated x y (colored red (solidCircle (0.3)))
  
pintaCuadrado :: Double -> Double -> Picture
pintaCuadrado x y = translated x y (colored green (solidRectangle 0.9 0.9))

pintaBloqueInter :: BloqueInter -> Picture
pintaBloqueInter ((a1, a2),(b1, b2), (c1, c2), (d1, d2), (e1, e2)) = 
    (translated x11 x12 (colored black (solidCircle (0.3))) & pintaCuadradoAzul x11 x12) &
    (translated x21 x22 (colored black (solidCircle (0.3))) & pintaCuadradoAzul x21 x22)  
    & (translated x31 x32 (colored black (solidCircle (0.3))) & pintaCuadradoAzul x31 x32)
    & (translated x41 x42 (colored black (solidCircle (0.3))) & pintaCuadradoAzul x41 x42) 
    & (translated x51 x52 (colored black (solidCircle (0.3))) & pintaCuadradoAzul x51 x52)  
  where x11 = fromIntegral a1
        x12 = fromIntegral a2
        x21 = fromIntegral b1
        x22 = fromIntegral b2
        x31 = fromIntegral c1
        x32 = fromIntegral c2
        x41 = fromIntegral d1 
        x42 = fromIntegral d2
        x51 = fromIntegral e1
        x52 = fromIntegral e2
     
pintaNegro :: Int -> Int -> Picture
pintaNegro n m = translated (x) (y) (solidRectangle x y)
  where x = fromIntegral m
        y = fromIntegral n



--Recursivo 1: Recive una lista formada por los bloques que delimitan el area jugable y los pinta
pintaBloqueBorde :: [Punto] -> Picture
pintaBloqueBorde [] = blank
pintaBloqueBorde ((f,c):ps) = (translated x y (colored black (solidCircle (0.1))) & pintaCuadradoAzul x y)   & pintaBloqueBorde ps
  where x = fromIntegral f
        y = fromIntegral c

pintaCuadradoAzul :: Double -> Double -> Picture
pintaCuadradoAzul x y = translated x y (colored blue (solidRectangle 0.9 0.9))


--Orden Superior 1: 
pintaCarcel3 :: [Punto] -> Picture
pintaCarcel3 ps =
  pictures $
  map (\(f,c) -> pintaCuadradoAzul (fromIntegral f) (fromIntegral c)) ps

--Orden Superior 2: 
pintaCarcelGanador :: [Punto] -> Picture
pintaCarcelGanador ps =
  pictures $
  map (\(f,c) -> pintaCuadradoAmarillo (fromIntegral f) (fromIntegral c)) ps

pintaCuadradoAmarillo :: Double -> Double -> Picture
pintaCuadradoAmarillo x y = translated x y (colored yellow (solidRectangle 0.9 0.9))




--Las funciones anteriores sustituyen a todo el código comentado que realizamos en la primera version del proyecto

{-
type Pierdes =(Punto, Punto, Punto, Punto, Punto, Punto, Punto, Punto)
pintaCarcel :: Pierdes -> Picture
pintaCarcel ((l1,l2), (l3, l4), (l5,l6), (l7,l8), (l9,l10), (l11,l12), (l13,l14),(l15,l16)) = 
    (translated x1 x2 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x1 x2) 
    & (translated x3 x4 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x3 x4)  
    & (translated x5 x6 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x5 x6)
    & (translated x7 x8 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x7 x8) 
    & (translated x9 x10 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x9 x10)  
    & (translated x11 x12(colored black (solidCircle (0.1))) & pintaCuadradoAzul x11 x12) 
    & (translated x13 x14 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x13 x14)  
    & (translated x15 x16 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x15 x16) 
  where x1 = fromIntegral l1
        x2 = fromIntegral l2
        x3 = fromIntegral l3
        x4 = fromIntegral l4
        x5 = fromIntegral l5
        x6 = fromIntegral l6
        x7 = fromIntegral l7
        x8 = fromIntegral l8
        x9 = fromIntegral l9
        x10 = fromIntegral l10
        x11 = fromIntegral l11
        x12 = fromIntegral l12
        x13 = fromIntegral l13
        x14 = fromIntegral l14
        x15 = fromIntegral l15
        x16 = fromIntegral l16

-}

{-
pintaSerpiente :: [(a,b)] -> Picture
pintaSerpiente [] = blank
pintaSerpiente xss = head[translated x y (colored yellow (solidCircle (0.1))) & pintaCuadrado x y | (x,y) <- xss]
-}
--[(a1, a2),(b1, b2), (c1, c2),(d1, d2)]

{-pintaSerpiente :: Serpiente -> Picture
pintaSerpiente ((a1, a2),(b1, b2), (c1, c2), (d1, d2)) = 
    (translated x11 x12 (colored yellow (solidCircle (0.3))) & pintaCuadrado x11 x12) &
    (translated x21 x22 (colored green (solidCircle (0.3))) & pintaCuadrado x21 x22)  
    & (translated x31 x32 (colored green (solidCircle (0.3))) & pintaCuadrado x31 x32)
    & (translated x41 x42 (colored green (solidCircle (0.3))) & pintaCuadrado x41 x42)  
  where x11 = fromIntegral a1
        x12 = fromIntegral a2
        x21 = fromIntegral b1
        x22 = fromIntegral b2
        x31 = fromIntegral c1
        x32 = fromIntegral c2
        x41 = fromIntegral d1 
        x42 = fromIntegral d2
-}  

{-
type Bordes = (Linea, Linea, Linea, Linea)

pintaBloqueBorde :: Bordes -> Picture
pintaBloqueBorde ((((p1,p2)),((p3,p4)),((p5,p6)),((p7,p8)),((p9,p10)),((p11,p12)),((p13,p14)),((p15,p16)),((p17,p18)),((p19,p20)),((p21,p22)),((p23,p24))),(((p25,p26)),((p27,p28)),((p29,p30)),((p31,p32)),((p33,p34)),((p35,p36)),((p37,p38)),((p39,p40)),((p41,p42)),((p43,p44)),((p45,p46)),((p47,p48))),(((p49,p50)),((p51,p52)),((p53,p54)),((p55,p56)),((p57,p58)),((p59,p60)),((p61,p62)),((p63,p64)),((p65,p66)),((p67,p68)),((p69,p70)),((p71,p72))),(((p73,p74)),((p75,p76)),((p77,p78)),((p79,p80)),((p81,p82)),((p83,p84)),((p85,p86)),((p87,p88)),((p89,p90)),((p91,p92)),((p93,p94)),((p95,p96)))) = 
    (translated x1 x2 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x1 x2) 
    & (translated x3 x4 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x3 x4)  
    & (translated x5 x6 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x5 x6)
    & (translated x7 x8 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x7 x8) 
    & (translated x9 x10 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x9 x10)  
    & (translated x11 x12 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x11 x12) 
    & (translated x13 x14 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x13 x14)  
    & (translated x15 x16 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x15 x16)
    & (translated x17 x18 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x17 x18) 
    & (translated x19 x20 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x19 x20)
    & (translated x21 x22 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x21 x22) 
    & (translated x23 x24 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x23 x24)  
    & (translated x25 x26 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x25 x26)
    & (translated x27 x28 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x27 x28) 
    & (translated x29 x30 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x29 x30)  
    & (translated x31 x32 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x31 x32) 
    & (translated x33 x34 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x33 x34)  
    & (translated x35 x36 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x35 x36)
    & (translated x37 x38 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x37 x38) 
    & (translated x39 x40 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x39 x40)
    & (translated x41 x42 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x41 x42) 
    & (translated x43 x44 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x43 x44)  
    & (translated x45 x46 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x45 x46)
    & (translated x47 x48 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x47 x48) 
    & (translated x49 x50 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x49 x50)  
    & (translated x51 x52 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x51 x52) 
    & (translated x53 x54 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x53 x54)  
    & (translated x55 x56 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x55 x56)
    & (translated x57 x58 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x57 x58) 
    & (translated x59 x60 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x59 x60)
    & (translated x61 x62 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x61 x62) 
    & (translated x63 x64 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x63 x64)  
    & (translated x65 x66 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x65 x66)
    & (translated x67 x68 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x67 x68) 
    & (translated x69 x70 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x69 x70)  
    & (translated x71 x72 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x71 x72) 
    & (translated x73 x74 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x73 x74)  
    & (translated x75 x76 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x75 x76)
    & (translated x77 x78 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x77 x78) 
    & (translated x79 x80 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x79 x80)
    & (translated x81 x82 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x81 x82) 
    & (translated x83 x84 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x83 x84)  
    & (translated x85 x86 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x85 x86)
    & (translated x87 x88 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x87 x88) 
    & (translated x89 x90 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x89 x90)  
    & (translated x91 x92 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x91 x92) 
    & (translated x93 x94 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x93 x94)  
    & (translated x95 x96 (colored black (solidCircle (0.1))) & pintaCuadradoAzul x95 x96)
    
  where x1 = fromIntegral p1
        x2 = fromIntegral p2
        x3 = fromIntegral p3
        x4 = fromIntegral p4
        x5 = fromIntegral p5
        x6 = fromIntegral p6
        x7 = fromIntegral p7
        x8 = fromIntegral p8
        x9 = fromIntegral p9
        x10 = fromIntegral p10
        x11 = fromIntegral p11
        x12 = fromIntegral p12
        x13 = fromIntegral p13
        x14 = fromIntegral p14
        x15 = fromIntegral p15
        x16 = fromIntegral p16
        x17 = fromIntegral p17
        x18 = fromIntegral p18
        x19 = fromIntegral p19
        x20 = fromIntegral p20
        x21 = fromIntegral p21
        x22 = fromIntegral p22
        x23 = fromIntegral p23
        x24 = fromIntegral p24
        x25 = fromIntegral p25
        x26 = fromIntegral p26
        x27 = fromIntegral p27
        x28 = fromIntegral p28
        x29 = fromIntegral p29
        x30 = fromIntegral p30
        x31 = fromIntegral p31
        x32 = fromIntegral p32
        x33 = fromIntegral p33
        x34 = fromIntegral p34
        x35 = fromIntegral p35
        x36 = fromIntegral p36
        x37 = fromIntegral p37
        x38 = fromIntegral p38
        x39 = fromIntegral p39
        x40 = fromIntegral p40
        x41 = fromIntegral p41
        x42 = fromIntegral p42
        x43 = fromIntegral p43
        x44 = fromIntegral p44
        x45 = fromIntegral p45
        x46 = fromIntegral p46
        x47 = fromIntegral p47
        x48 = fromIntegral p48
        x49 = fromIntegral p49
        x50 = fromIntegral p50
        x51 = fromIntegral p51
        x52 = fromIntegral p52
        x53 = fromIntegral p53
        x54 = fromIntegral p54
        x55 = fromIntegral p55
        x56 = fromIntegral p56
        x57 = fromIntegral p57
        x58 = fromIntegral p58
        x59 = fromIntegral p59
        x60 = fromIntegral p60
        x61 = fromIntegral p61
        x62 = fromIntegral p62
        x63 = fromIntegral p63
        x64 = fromIntegral p64
        x65 = fromIntegral p65
        x66 = fromIntegral p66
        x67 = fromIntegral p67
        x68 = fromIntegral p68
        x69 = fromIntegral p69
        x70 = fromIntegral p70
        x71 = fromIntegral p71
        x72 = fromIntegral p72
        x73 = fromIntegral p73
        x74 = fromIntegral p74
        x75 = fromIntegral p75
        x76 = fromIntegral p76
        x77 = fromIntegral p77
        x78 = fromIntegral p78
        x79 = fromIntegral p79
        x80 = fromIntegral p80
        x81 = fromIntegral p81
        x82 = fromIntegral p82
        x83 = fromIntegral p83
        x84 = fromIntegral p84
        x85 = fromIntegral p85
        x86 = fromIntegral p86
        x87 = fromIntegral p87
        x88 = fromIntegral p88
        x89 = fromIntegral p89
        x90 = fromIntegral p90
        x91 = fromIntegral p91
        x92 = fromIntegral p92
        x93 = fromIntegral p93
        x94 = fromIntegral p94
        x95 = fromIntegral p95
        x96 = fromIntegral p96

-}
