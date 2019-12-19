----------------------------------------------------------------------------------------
--
--  level_select.lua
-- Created by: Daniel
-- Date: December 18th, 2019
-- Description: Level select
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
sceneName = "level_select"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local background
local backButton


-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

local transitionSound = audio.loadStream("Sounds/bop.mp3")
local transitionSoundChannel
local music = audio.loadStream("Sounds/d.mp3")
local musicChannel = audio.play(music, {channel=5, loop = -1})

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


-- Creating Transition to Main Menu Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 1000})
    
if(soundOn == true)then
    transitionSoundChannel = audio.play(transitionSound)
   end
end    


local function Level2Transition( )
   composer.gotoScene( "level2_screen", {effect = "fade", time = 1000})
    audio.stop()
    
   if(soundOn == true)then
    transitionSoundChannel = audio.play(transitionSound)
   end
end    

local function Level4Transition( )
   composer.gotoScene( "level4_screen", {effect = "fade", time = 1000})
    audio.stop()
    
    transitionSoundChannel = audio.play(transitionSound)
end    
-- fades in the buttons
local function ButtonFade( event )
    backButton.alpha = backButton.alpha + 0.006
    level2Button.alpha = level2Button.alpha + 0.006
    level4Button.alpha = level4Button.alpha + 0.006

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
    background = display.newImageRect("Images/LevelSelectScreenNoah@2x.png", display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    

    sceneGroup:insert( background )

   

    
    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Back Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight - 100,
            width = 200,
            height = 100,
          

            

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressedNoah@2x.png",
            overFile = "Images/BackButtonPressedNoah@2x.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = MainMenuTransition          
        } )
       
        backButton.alpha = 0


-- Creating level1  Button
    level2Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.36 - 40,
            y = display.contentHeight/2 - 50,
            width = 200,
            height = 125,
            

            -- Insert the images here
            defaultFile = "Images/Level2ScreenDaniel@2x.png",
            overFile = "Images/Level2ScreenDaniel@2x.png",

            -- When the button is released, call the level1 screen transition function
            onRelease = Level2Transition          
        } )
       
        level2Button.alpha = 0

        -- Creating level3  Button
    level4Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.36 - 40,
            y = display.contentHeight/2 + 150,
            width = 200,
            height = 125,
            

            -- Insert the images here
            defaultFile = "Images/Level4ScreenDaniel@2x.png",
            overFile = "Images/Level4ScreenDaniel@2x.png",

            -- When the button is released, call the level1 screen transition function
            onRelease = Level4Transition          
        } )
       
        level4Button.alpha = 0
        
       
    -----------------------------------------------------------------------------------------
    
    -----------------------------------------------------------------------------------------
    sceneGroup:insert( backButton )
    sceneGroup:insert( level2Button )
    sceneGroup:insert( level4Button )

end  



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
   

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------
 Runtime:addEventListener("enterFrame", ButtonFade)
    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then 
       
        if (soundOn == true) then
            audio.resume(musicChannel)

       
                       
        end
       

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
        Runtime:removeEventListener( "enterFrame")
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    
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