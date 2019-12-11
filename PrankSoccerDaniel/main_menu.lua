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
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
soundOn = true


-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local background
local playButton
local creditsButton
local instructionsButton
local muteButton
local unMuteButton
local border

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------


-- audio variables
local transitionSound = audio.loadStream("Sounds/bop.mp3")
local transitionSoundChannel
local music = audio.loadStream("Sounds/mainMusic.mp3")
local musicChannel = audio.play(music, {channel=1, loop = -1})

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


-- Creating Mute function to pause audio
local function Mute( touch )
    if (touch.phase == "ended") then
        audio.pause(musicChannel)
        soundOn = false
        muteButton.isVisible = false
        unMuteButton.isVisible = true
    end
end


-- Creating Mute function to pause audio
local function UnMute( touch )
    if (touch.phase == "ended") then
        audio.resume(musicChannel)
        soundOn = true
        muteButton.isVisible = true
        unMuteButton.isVisible = false
    end
end




-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level2_screen", {effect = "fade", time = 1000})
    
    transitionSoundChannel = audio.play(transitionSound)
end    

-- Creating Transition to Instructions screen
local function InstructionsTransition( )
    composer.gotoScene( "instructions", {effect = "slideUp", time = 1000})
    transitionSoundChannel = audio.play(transitionSound)
end    


--Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "slideLeft", time = 500})
    transitionSoundChannel = audio.play(transitionSound) 
end 
-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------
   
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- OBJECT CREATION
    -----------------------------------------------------------------------------------------

    -- Creating background and setting the image
   background = display.newImageRect("Images/FakeMainMenuNoah@2x.png", display.contentWidth, display.contentHeight)
   background.x = display.contentCenterX
   background.y = display.contentCenterY
  
  
    -- Associating display objects with this scene 
    sceneGroup:insert( background )

    muteButton = display.newImageRect("Images/muteButtonUnpressed.png", 100, 100)
    muteButton.x = 512
    muteButton.y = 600
    muteButton.isVisible = true

    unMuteButton = display.newImageRect("Images/muteButtonPressed.png", 100, 100)
    unMuteButton.x = 512
    unMuteButton.y = 600
    unMuteButton.isVisible = false

    sceneGroup:insert( muteButton )
    sceneGroup:insert( unMuteButton )
    
   
    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   


    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth - 512,
            y = display.contentHeight - 385,
            width = 200,
            height = 100,            

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedDaniel@2x.png",
            overFile = "Images/PlayButtonPressedDaniel@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition          
        } )
    
    -----------------------------------------------------------------------------------------
    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth - 174,
            y = display.contentHeight - 150,

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
            x = display.contentWidth - 850,
            y = display.contentHeight - 150,

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


end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    --plays background music loop
    

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
        
        if (soundOn == true) then
            audio.resume(musicChannel)
            unMuteButton.isVisible = false
            muteButton.isVisible = true
        else
            unMuteButton.isVisible = true
            muteButton.isVisible = false
            audio.pause(musicChannel)

        end
        muteButton:addEventListener("touch", Mute)
        unMuteButton:addEventListener("touch", UnMute)

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
        muteButton:removeEventListener("touch", Mute)
        unMuteButton:removeEventListener("touch", UnMute)
        audio.pause(musicChannel)
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