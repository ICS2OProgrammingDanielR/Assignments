-- Title: Animating Images
-- Name: Daniel Raissi
-- Course: ICS2O/3C
-- This program makes images move

-- get rid of status bar
display.setStatusBar(display.HiddenStatusBar)

-------------------------------------------------------------------------------
-- LOCAL VARIBLES
------------------------------------------------------------------------------
local background
local alexFace
local steveFace
local scrollSpeed69 = 1
local scrollSpeed420 = 2
local textObject
local pewdiepie
-------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------

-- background image
background = display.newImageRect("Images/mincraftbackground.png", 1024, 768)
background.x = display.contentWidth/2
background.y = display.contentHeight/2

-- create alex face
alexFace = display.newImageRect("Images/Alexsface.png", 100, 100)
alexFace.x = display.contentWidth/2
alexFace.y = display.contentHeight/2

-- create steve face
steveFace = display.newImageRect("Images/stevesface.png", 100, 100)
steveFace.x = display.contentWidth/3
steveFace.y = display.contentHeight/3

-- create steve face
pewdiepie = display.newImageRect("Images/durp.png", 100, 100)
pewdiepie.x = display.contentWidth/3
pewdiepie.y = display.contentHeight/3

-- Title
textObject = display.newText( "Minecraft gone crazy", 500, 400, nil, 50 )

-- sets the color of the textObject
textObject:setTextColor(255/255, 255/255, 255/255)

----------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------

local function MoveAlexFace( event )
	alexFace.x = alexFace.x + scrollSpeed69
	alexFace.y = alexFace.y + scrollSpeed69

	-- spins alex face
	alexFace:rotate(69)
	if(alexFace.x < 0) then alexFace.x = alexFace.x + 3 scrollSpeed69 = -scrollSpeed69 end--Left
    if((alexFace.x + alexFace.width) > display.contentWidth) then alexFace.x = alexFace.x - 3 scrollSpeed69 = -scrollSpeed69 end--Right
    if(alexFace.y < 0) then scrollSpeed420 = -scrollSpeed420 end--Up
end

local function MoveSteveFace( event )
	steveFace.x = steveFace.x + scrollSpeed420
	steveFace.y = steveFace.y + scrollSpeed420

	-- spins alex face
	steveFace:rotate(69)
	if(steveFace.x < 0) then steveFace.x = steveFace.x + 3 scrollSpeed69 = -scrollSpeed69 end--Left
    if((steveFace.x + steveFace.width) > display.contentWidth) then steveFace.x = steveFace.x - 3 scrollSpeed69 = -scrollSpeed69 end--Right
    if(steveFace.y < 0) then scrollSpeed420 = -scrollSpeed420 end--Up
end

local function MovePewdiepie( event )
	pewdiepie.x = pewdiepie.x + scrollSpeed69
	pewdiepie.y = pewdiepie.y + scrollSpeed69

	-- spins alex face
	pewdiepie:rotate(69)
	if(pewdiepie.x < 0) then pewdiepie.x = pewdiepie.x + 3 scrollSpeed69 = -scrollSpeed69 end--Left
    if((pewdiepie.x + pewdiepie.width) > display.contentWidth) then pewdiepie.x = pewdiepie.x - 3 scrollSpeed69 = -scrollSpeed69 end--Right
    if(pewdiepie.y < 0) then scrollSpeed420 = -scrollSpeed420 end--Up
end
------------------------------------------------------------------------------
-- EVENT LISTENER
------------------------------------------------------------------------------
-- moves alex face
Runtime:addEventListener("enterFrame", MoveAlexFace)

-- move steve face
Runtime:addEventListener("enterFrame", MoveSteveFace)

-- move pewdiepie
Runtime:addEventListener("enterFrame", MovePewdiepie)