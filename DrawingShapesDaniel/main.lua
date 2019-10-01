-- Title: AreaOfRectangleAndCircle
-- Name: Your Name
-- Course: ICS2O/3C
-- This program will show shapes on an ipad

-- sets the background color
display.setDefault("background", 0.69, 0.69, 0.69)

-- remove status background
display.setStatusBar(display.HiddenStatusBar)

-- create local "upside down triangle"

local myTriangle
local myTriangleText
local vMyTriangle = {-69, -80, 69, -80, 0, 90}
local textSizeMyTriangle = 60
local baseOfMyTriangle = 250
local heightOfMyTriangle = 70

-- draw my triangle
myTriangle = display.newPolygon(0, 0, vMyTriangle)

myTriangle.anchorX = 0
myTriangle.anchorY = 0
myTriangle.x = 450
myTriangle.y = 50

-- set the width of the border
myTriangle.strokeWidth = 20

-- set the color of the inside of the triangle
myTriangle:setFillColor(0/255, 247/255, 255/255)

-- set the color of the inside of the triangle
myTriangle:setStrokeColor(229/255, 101/255, 243/255)

local myHexagon
local myHexagonText
local vMyHexagon = {-20,-20, 0,0, 0,20, 20,40, 40,40, 0,-20}
local baseOfMyHexagon = 250
local heightOfMyHexagon = 70

-- draw my hexagon
myHexagon = display.newPolygon(0, 0, vMyHexagon)

myHexagon.anchorX = 0
myHexagon.anchorY = 0
myHexagon.x = 200
myHexagon.y = 50

-- set the width of the border
myHexagon.strokeWidth = 20
-- set the color of the inside of the triangle
myHexagon:setFillColor(0/255, 247/255, 255/255)

-- set the color of the inside of the triangle
myHexagon:setStrokeColor(229/255, 101/255, 243/255)