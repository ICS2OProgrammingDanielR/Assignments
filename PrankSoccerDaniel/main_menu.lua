-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Noah
-- Date: November 20th, 2019
-- Description: This is the main menu, displaying the credits, instructions, play buttons and mute button.
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
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local background
local playButton
local creditsButton
local instructionsButton
local muteButton
local unmuteButton
local border

-- audio variables
local channel
local channel2
local transitionSound = audio.loadStream("Sounds/bop.mp3")
local music = audio.loadStream("Sounds/mainMenu.mp3")

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


-- Creating Mute function to pause audio



-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level2_screen", {effect = "zoomOutIn", time = 1000})
    audio.stop()
    channel2 = audio.play(transitionSound)
end    

-- Creating Transition to Instructions screen
local function InstructionsTransition( )
    composer.gotoScene( "instructions", {effect = "slideUp", time = 1000})
    audio.stop()
    channel2 = audio.play(transitionSound)
end    


--Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "slideLeft", time = 500})
    audio.stop()
    channel2 = audio.play(transitionSound)
end 
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
function Mute( )
    
    audio.pause(channel)
    muteButton.isVisible = false
    unmuteButton.isVisible = true
    channel2 = audio.play(transitionSound)
    
end    

-- creating unmute function to resume audio

function UnMute( )
    
    audio.resume(channel)
    channel2 = audio.play(transitionSound)
    muteButton.isVisible = true
    unmuteButton.isVisible = false

end    
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Creating background and setting the image
   background = display.newImageRect("Images/FakeMainMenuNoah@2x.png", display.contentWidth, display.contentHeight)
   background.x = display.contentCenterX
   background.y = display.contentCenterY
  
  
    -- Associating display objects with this scene 
    sceneGroup:insert( background )

   
    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

 
 -- Creating Mute Button
    muteButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth - 512,
            y = display.contentHeight - 100 ,
            

            -- Insert the images here
            defaultFile = "Images/muteButtonUnpressed.png",
            overFile = "Images/muteButtonPressed.png",

            -- When the button is released, call the Mute function
            onRelease = Mute          
        } )
        muteButton.width = 100
        muteButton.height = 100

-- Creating unMute Button (Unmute Button)
    unmuteButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth - 512,
            y = display.contentHeight - 100,
            

            -- Insert the images here
            defaultFile = "Images/muteButtonUnpressed.png",
            overFile = "Images/muteButtonPressed.png",

            -- When the button is released, call the unMute function
            onRelease = UnMute          
        } )
        unmuteButton.width = 100
        unmuteButton.height = 100
       


    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position 
            x = display.contentWidth - 512,
            y = display.contentHeight - 384,
            

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedDaniel@2x.png",
            overFile = "Images/PlayButtonPressedDaniel@2x.png",

            -- When the button is pressed and realeased lvel one screen shold appear
            onRelease = Level1ScreenTransition          
        } )
        playButton.width = 200
        playButton.height = 100
    -----------------------------------------------------------------------------------------
    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth - 256,
            y = display.contentHeight - 100,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressedNoah@2x.png",
            overFile = "Images/CreditsButtonPressedNoah@2x.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 
   
        creditsButton.width = 200
        creditsButton.height = 100 
    -- ADD INSTRUCTIONS BUTTON WIDGET


    -- Creating instructions Button
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth  - 768,
            y = display.contentHeight - 100,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressedNoah@2x.png",
            overFile = "Images/InstructionsButtonPressedNoah@2x.png",

            -- When the button is released, call the Instructions transition function
            onRelease = InstructionsTransition
        } ) 
        instructionsButton.width = 200
        instructionsButton.height = 100
    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )

    -- Send the background image to the back layer so all other objects can be on top
  
    background:toBack()



end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    --plays background music loop
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