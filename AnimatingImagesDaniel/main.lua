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

----------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------

local function MoveAlexFace( event )
	alexFace.x = alexFace.x + scrollSpeed69
	alexFace.y = alexFace.y + scrollSpeed69

	-- spins alex face
	alexFace:rotate(69)
end

local function MoveSteveFace( event )
	steveFace.x = steveFace.x + scrollSpeed420
	steveFace.y = steveFace.y + scrollSpeed420

	-- spins alex face
	steveFace:rotate(69)
end
------------------------------------------------------------------------------
-- EVENT LISTENER
------------------------------------------------------------------------------
-- moves alex face
Runtime:addEventListener("enterFrame", MoveAlexFace)

-- move steve face
Runtime:addEventListener("enterFrame", MoveSteveFace)