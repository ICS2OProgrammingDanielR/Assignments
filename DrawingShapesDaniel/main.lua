-- Title: AreaOfRectangleAndCircle
-- Name: Daniel Raissi
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
local textSize = 50
local areaOfMyTriangle = 8750

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

-- write the area of the triangle
areaText = display.newText("The area of this triangle with a base of \n" ..
	    baseOfMyTriangle .. " and a height of " .. heightOfMyTriangle .. " is " .. 
		areaOfMyTriangle .. " pixels².", 0, 0, Ariel, textSize)
       
-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

local myHexagon
local myHexagonText
local vMyHexagon = {-50,-60, 20,20, 20,40, 30,60, 60,60, 20,-40}
local baseOfMyHexagon = 250
local heightOfMyHexagon = 70

-- draw my hexagon
myHexagon = display.newPolygon(0, 0, vMyHexagon)

myHexagon.anchorX = 0
myHexagon.anchorY = 0
myHexagon.x = 10
myHexagon.y = 50

-- set the width of the border
myHexagon.strokeWidth = 10
-- set the color of the inside of the triangle
myHexagon:setFillColor(0/255, 247/255, 255/255)

-- set the color of the inside of the triangle
myHexagon:setStrokeColor(0/255, 247/255, 255/255)

local myOctagon
local myOctagonText
local vMyOctagon = {-20,-80, 20,-80, 25,-70, 25,-50, 20,0, -20,0, -25,-50, -25,-70}
local baseOfMyOctagon = 200
local heightOfMyOctagon = 69

-- draw my octagon
myOctagon = display.newPolygon(0,0, vMyOctagon)

myOctagon.x = 800
myOctagon.y = 100
-- set the width of the border
myHexagon.strokeWidth = 20
-- set the color of the inside of the triangle
myOctagon:setFillColor(0/255, 247/255, 255/255)

-- set the color of the inside of the triangle
myOctagon:setStrokeColor(0/255, 247/255, 255/255)