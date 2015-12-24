module Main where

import Data.Time.Clock.POSIX as TP
--data Open = Open Float deriving (Show)
--data High = High Float deriving (Show)
--data Low = Low Float deriving (Show)
--data Close = Close Float deriving (Show)
--data Volume = Volume Int deriving (Show)
--  Candle Open High Low Close Volume deriving (Show)
-- data Points = Points Price Price Price Price deriving (Show)


-- operationType :: Points -> Operation
-- operationType points = undefined

-- getDifferenceMovingAvg ::

-- Points: (price1_1, price1_2, price2_1, price2_2)
-- getAvgPrices :: [Price] -> Points
-- getAvgPrices ticks = undefined

-- isBullToBear :: Points -> Bool
-- isBullToBear points = undefined

-- isBearToBull :: Points -> Bool
-- isBearToBull = undefined
-- h^2 = c1^2 +

data Price = Price Float deriving (Show)

data Point = Point { time :: TP.POSIXTime
                     , price :: Price
                     } deriving (Show)

data Operation = Buy | CloseBuy | Sell | CloseSell | Stay deriving (Show)

data Segment = Segment { point0 :: Point
                       , point1 :: Point
                       } deriving (Show)

-- buy :: Buy
-- buy = 0

-- closeBuy :: CloseBuy
-- closeBuy = 1

-- sell :: Sell
-- sell = 2

-- closeSell :: CloseSell
-- closeSell = 3

-- stay :: Stay
-- stay = 4

getAngle :: Segment -> Segment -> Float
getAngle segment1 segment2 = undefined

getOperationType :: [Point] -> Operation
getOperationType points = Buy

getSegmentLength :: Point -> Point -> Float
getSegmentLength = undefined

getAverage :: Float -> Float -> Float -> Float -> Float
getAverage previous current diminishingFactor smoothingFactor = (previous * diminishingFactor + current * smoothingFactor) / (diminishingFactor + smoothingFactor) 

ghost :: Float -> Float -> Float -> Float -> Float
ghost current previous diminishingFactor smoothingFactor = 2 * current - getAverage previous current diminishingFactor smoothingFactor


main :: IO()
main = do
  putStrLn $ show (getOperationType [Point {time=0, price=Price 1}, Point {time=4, price=Price 2}])

