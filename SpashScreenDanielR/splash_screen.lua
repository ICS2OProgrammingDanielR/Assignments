-- splash_screen

---------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )
local text = display.newText("SoccerGPA", 0, 0, Arial, 80)
local introNoise = audio.loadStream( "Sounds/introNoise.mp3")
local introNoiseChannel

-- Title: Honey Nut
-- Name: Your Name
-- Course: ICS2O/3C
-- This program will show the splash screen

--text.isVisible = false

-- get rid of the status bar
display.setStatusBar(display.HiddenStatusBar)

local logo = display.newImageRect("Images/CompanyLogoDaniel@2x.png", 50, 50)



--------------------------------------------------------------------------



-- size of the logo
local function LogoSize ()
	logo.xScale = logo.xScale + 0.7
	logo.yScale = logo.yScale + 0.7
    logo.rotation = 0
    logo.x = display.contentWidth/2
    logo.y = display.contentHeight/2
    
    -- background noise
    introNoiseChannel = audio.play(introNoise)
end

-- set the image to be transparent
logo.alpha = 1

local function growlogo( event )
	-- make the logo grow gradually
	logo:scale(1.01,1.01)

    -- fadeing
    logo.alpha = logo.alpha - 0.0000001
end
Runtime:addEventListener("enterFrame", growlogo)


-- location of logo
logo.x = display.contentCenterX
logo.y = display.contentCenterY

-- go to the main menu
local function GoToMainMenu()
    -- go to main menu screen
    composer.gotoScene( "main_menu" )
end

-- logo goes fully invisible
local function MakeLogoFullyInvis()
    logo.isVisible = false

    if (logo.isVisible == false) then
        text.isVisible = true
        timer.performWithDelay(500, GoToMainMenu)
    end
end


-- set the image to be transparent
text.alpha = 1

local function fadewords2( event )
    
if ( text.isVisible == true) then
    text.alpha = text.alpha - 0.01
end
end

local function fadewords( )
    Runtime:addEventListener("enterFrame", fadewords2)
end

local function logobyebye()
    -- time till text appears
    timer.performWithDelay(4000, MakeLogoFullyInvis)
end


text.x = display.contentCenterX
text.y = display.contentHeight/3

fadewords()


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
end



-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
		elseif ( phase == "did" ) then

    end

end




-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end






-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
