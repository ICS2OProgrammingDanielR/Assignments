----------------------------------------------------------------------------------------
--
--  instructions.lua
-- Created by: Daniel
-- Date: November 22th, 2019
-- Description: This is the instructions screen.
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "instructions"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local background
local backButton
local channel
local channel2
local transitionSound = audio.loadStream("Sounds/bop.mp3")
local music = audio.loadStream("Sounds/instructionsMusic.mp3")

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


-- Creating Transition to Main Menu Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 1000})
    audio.stop()

    channel2 = audio.play(transitionSound)
end    
----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------
  -- creating the background
   background = display.newImageRect("Images/InstructionsScreenNoah@2x.png", display.contentWidth, display.contentHeight)
   background.x = display.contentCenterX
   background.y = display.contentCenterY

      sceneGroup:insert( background )
    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth - 910,
            y = display.contentHeight - 70,
            

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressedNoah@2x.png",
            overFile = "Images/BackButtonPressedNoah@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = MainMenuTransition          
        } )
        backButton.width = 200
        backButton.height = 100

       
    -----------------------------------------------------------------------------------------
    
    -----------------------------------------------------------------------------------------
 sceneGroup:insert( backButton )

    -- Send the background image to the back layer so all other objects can be on top
  
    background:toBack()


end  



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    channel = audio.play(music, {loop = -1})

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

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

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )



return scene