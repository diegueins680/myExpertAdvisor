{-# LANGUAGE ForeignFunctionInterface #-}

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

-- data Magnitud = Either Price Float | POSIXTime  deriving (Show)

data Point = Point { time :: Float
                     , price :: Float
                     } deriving (Show)

data Operation = Buy | CloseBuy | Sell | CloseSell | Stay deriving (Show)

data Segment = Segment { point0 :: Point
                       , point1 :: Point
                       } deriving (Show)

factorTime :: Float
factorTime = 1

factorPrice :: Float
factorPrice = 1

timeDelta :: Point -> Point -> Float
timeDelta pointA pointB = time pointB - time pointA

priceDelta :: Point -> Point -> Float
priceDelta pointA pointB = price pointB - price pointA

getAngleRad :: Point -> Point -> Float
getAngleRad pointA pointB = atan((priceDelta pointA pointB) /(timeDelta pointA pointB))

getAngleDeg :: Point -> Point -> Float
getAngleDeg pointA pointB = radToDeg (getAngleRad pointA pointB)

radToDeg :: Float -> Float
radToDeg rads = rads * 360 / (2 * pi)

getOperationType :: [Point] -> Operation
getOperationType points = Buy

getSegmentLength :: Point -> Point -> Float
getSegmentLength a b = sqrt (((getSideLength (factorTime * time a) (factorTime * time b))^2 +
                            (getSideLength (factorPrice * price a) (factorPrice * price b)^2)))

getSideLength :: Float -> Float -> Float
getSideLength x y = y - x

-- getMagnitudByFactor :: Float -> Float -> Float
-- getMagnitudByFactor magnitud = case magnitud of
                              -- POSIXTime -> magnitud * factorTime
                              -- Price -> magnitud * factorPrice
                              -- _ -> magnitud * factorTime

getAverage :: Float -> Float -> Float -> Float -> Float
getAverage previous current diminishingFactor smoothingFactor = (previous * diminishingFactor + current * smoothingFactor) / (diminishingFactor + smoothingFactor) 

ghost :: Float -> Float -> Float -> Float -> Float
ghost current previous diminishingFactor smoothingFactor = 2 * current - getAverage previous current diminishingFactor smoothingFactor


main :: IO()
main = do
  putStrLn $ show (getOperationType [Point {time=0, price=1}, Point {time=4, price=2}])
