----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Daniel Raissi
-- Date: 2019
-- Description: This is the level 2 screen, displaying level 2
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- load physics
local physics = require("physics")

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local background
local backButton
local channel
local music = audio.loadStream("Sounds/level2Music.mp3")
local channel2
local transitionSound = audio.loadStream("Sounds/bop.mp3")
local leftNet
local rightNet
local bottomBorder
local topBorder
local rightBorder
local leftBorder
local character
local upButton
local verticalSpeed = 200
local numUp = 0
local platform1
local platform2
local platform3
local ball1
local goalie
local bad1
local bad2
local netBorder
local netBorder2
local netBorder3
local netBorder4
local characterRolling
local characterJumping
local goal = 0
local goal_ = 0
local goalText 
local goal_text




-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function ChangeScore2( event )
  if (goal_ == 1)then
    goal_text.text = "1"
  elseif (goal_ == 2)then
    goal_text.text = "2"
  elseif (goal_ == 3)then
    goal_text.text = "3"
  end
end

local function ChangeScore( event )
  if (goal == 1)then
    goalText.text = "1"
  elseif (goal == 2)then
    goalText.text = "2"
  elseif (goal == 3)then
    goalText.text = "3"

  end
end

local function onCollision( self, event )
    if  (event.target.myName == "bad1") or
            (event.target.myName == "bad2") then
            

            

            -- make everything invisible
            character.isVisible = false
            platform1.isVisible = false
            platform2.isVisible = false
            platform3.isVisible = false
            ball1.isVisible = false
            goalie.isVisible = false
            bad1.isVisible = false
            bad2.isVisible = false
            leftNet.isVisible = false
            rightNet.isVisible = false





            

            -- asks a question
            composer.showOverlay( "level1_Question", { isModal = true, effect = "fade", time = 500})

           
        end
end


local function AddCollisionListeners()
     
    bad1.collision = onCollision
    bad1:addEventListener( "collision" )
    bad2.collision = onCollision
    bad2:addEventListener( "collision" )
 
end

local function RemoveCollisionListeners()

    bad1:removeEventListener( "collision" )
    bad2:removeEventListener( "collision" )
    
  end

local function AddPhysicsBodies()
    --add to the physics engine
    physics.addBody( netBorder2, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( netBorder3, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( netBorder4, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( netBorder, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( bottomBorder, "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( topBorder, "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( character, "dynamic", { density=1, friction=0.5, bounce=0.6, rotation=0 } )
    physics.addBody( rightBorder, "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( leftBorder,  "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( platform1,  "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( platform2,  "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody( platform3,  "static", { density=1.0, friction=1, bounce=0 } )
    physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.9, radius=25})
    physics.addBody(bad1, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(bad2, "static",  {density=0, friction=0, bounce=0} )
   
end

local function RemovePhysicsBodies()
    
      physics.removeBody( netBorder2 )
      physics.removeBody( netBorder )
      physics.removeBody( netBorder3 )
      physics.removeBody( netBorder4 )
      physics.removeBody( character )
      physics.removeBody( bottomBorder )
      physics.removeBody( topBorder )
      physics.removeBody( rightBorder )
      physics.removeBody( leftBorder )
      physics.removeBody( platform1 )
      physics.removeBody( platform2 )
      physics.removeBody( platform3 )
      physics.removeBody( ball1)
end



local function Change3( )
  characterRolling.isVisible = false
  character.isVisible = true
end
local function Change4(  )
  characterRolling.isVisible = true
  characterJumping.isVisible = false
  character.isVisible = false
  timer.performWithDelay(400, Change3)
end

local function Change2( )
  characterJumping.isVisible = false
  characterRolling.isVisible = false
  character.isVisible = true
end
local function Change(  )
  characterJumping.isVisible = true
  characterRolling.isVisible = false
  character.isVisible = false
  timer.performWithDelay(650, Change2)
end
local function Character( event )
  characterJumping.x = character.x
  characterJumping.y = character.y
  characterJumping.rotation = character.rotation
end
local function Character2( event )
  characterRolling.x = character.x
  characterRolling.y = character.y
  characterRolling.rotation = character.rotation
end
  
local function Stop(  )
  numUp = 0
end


local function MoveCharacterUp()
Change()

if (numUp == 5) then
  character.y = character.y
  timer.performWithDelay(500, Stop)

else
character:setLinearVelocity( 0, -verticalSpeed )
numUp = numUp + 1
end


end

local function MoveCharacterRight()
  Change4()
character:rotate (10)

character:setLinearVelocity( 120, 10 )
end

local function MoveCharacterLeft()
  Change4()
character:rotate (-10)

character:setLinearVelocity( -120, 10 )
end


-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "fade", time = 1000})
    audio.stop()
    character.isVisible = false
    ball1.isVisible = false
    channel2 = audio.play(transitionSound)
end    
----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
function ResumeGame()
            character.isVisible = true
          
            ball1.isVisible = true
            ball1.x = display.contentWidth/2 + 150
            goalie.isVisible = true
            leftNet.isVisible = true
            rightNet.isVisible = true
            character.x = display.contentWidth/2
            character.y = display.contentHeight/2 + 200
            character.rotation = 0
            goal = goal + 1
            upButton.isVisible = true
            rightButton.isVisible = true
            leftButton.isVisible = true
            ChangeScore()


end


function ResumeGame2()
            character.isVisible = true
          
            ball1.isVisible = true
            ball1.x = display.contentWidth/2 + 150
            goalie.isVisible = true
            leftNet.isVisible = true
            rightNet.isVisible = true
            character.x = display.contentWidth/2
            character.y = display.contentHeight/2 + 200
            character.rotation = 0
            goal_ = goal_ + 1
            upButton.isVisible = true
            rightButton.isVisible = true
            leftButton.isVisible = true
            ChangeScore2()


end



-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- OBJECT CREATION
    -----------------------------------------------------------------------------------------   

    -- background creation
    background = display.newImageRect("Images/level2ScreenDaniel@2x.png", display.contentWidth, display.contentHeight)
   background.x = display.contentCenterX
   background.y = display.contentCenterY

      sceneGroup:insert( background )

   -- point text for you
   goalText = display.newText("0", display.contentWidth/1.5 + 20 , display.contentHeight/7 + 10 , nil, 150 )
   goalText:setFillColor(255/255, 0/255, 0/255)
   sceneGroup:insert( goalText )
   

   -- point text for your opponent
   goal_text = display.newText("-0", display.contentWidth/1.5 + 160 , display.contentHeight/7 + 10 , nil, 150 )
   goal_text:setFillColor(255/255, 0/255, 0/255)
   sceneGroup:insert( goal_text)

   bottomBorder = display.newRect(display.contentWidth/2, 708, display.contentWidth, 100)
   bottomBorder.alpha = 0

    sceneGroup:insert( bottomBorder )


  topBorder = display.newRect(display.contentWidth/2, -90, display.contentWidth, 100)
     topBorder.alpha = 0

    sceneGroup:insert( topBorder )

  rightBorder = display.newRect(display.contentWidth + 60, display.contentHeight/2, 100, display.contentHeight)
   rightBorder.alpha = 0

    sceneGroup:insert( rightBorder )
 
 leftBorder = display.newRect(-60, display.contentHeight/2, 100, display.contentHeight)
   leftBorder.alpha = 0

    sceneGroup:insert( leftBorder )

   character = display.newImageRect("Images/character.png",75, 125)
   character.x = display.contentCenterX
   character.y = display.contentCenterY

   character.isFixedRotation = true

    sceneGroup:insert( character )

    characterJumping = display.newImageRect("Images/characterRolling.png",75, 125)
    characterJumping.x = character.x
    characterJumping.y = character.y
    characterJumping.isVisible = false

     characterRolling = display.newImageRect("Images/characterJumping.png",75, 125)
    characterRolling.x = character.x
    characterRolling.y = character.y
    characterRolling.isVisible = false

     sceneGroup:insert( characterRolling )
    sceneGroup:insert( characterJumping )

  platform1 = display.newImageRect("Images/platform.png",200, 25)
   platform1.x = display.contentCenterX
   platform1.y = display.contentCenterY - 200

    
    sceneGroup:insert( platform1 )

  platform2 = display.newImageRect("Images/platform.png",200, 25)
   platform2.x = display.contentCenterX + 300
   platform2.y = display.contentCenterY 

    
    sceneGroup:insert( platform2 )

  platform3 = display.newImageRect("Images/platform.png",200, 25)
   platform3.x = display.contentCenterX - 300
   platform3.y = display.contentCenterY 

    
    sceneGroup:insert( platform3 )

    
  ball1 = display.newImage("Images/BallNoah@2x.png",  display.contentCenterX, 100)
  ball1.yScale = 0.125
  ball1.xScale = 0.125


    sceneGroup:insert( ball1 )

goalie = display.newImageRect("Images/OppositeTeamCharacterNoah@2x.png",75, 125)
   goalie.x = display.contentCenterX + 300
   goalie.y = display.contentCenterY + 200

   sceneGroup:insert( goalie)

bad1 = display.newImageRect("Images/OppositeTeamCharacterNoah@2x.png",75, 125)
  bad1.x = display.contentCenterX - 300
  bad1.y = display.contentCenterY - 75
  bad1.myName = "bad1"

bad2 = display.newImageRect("Images/OppositeTeamCharacterNoah@2x.png",75, 125)
  bad2.x = display.contentCenterX + 300
  bad2.y = display.contentCenterY - 75
  bad2.myName = "bad2"

  sceneGroup:insert( bad1 )
  sceneGroup:insert( bad2 )

netBorder = display.newRect(display.contentCenterX + 450,515,150,10)
 netBorder.alpha = 0

   sceneGroup:insert( netBorder)

netBorder2 = display.newRect(display.contentCenterX - 450,515,150,10)
 netBorder2.alpha = 0

   sceneGroup:insert( netBorder2)

netBorder3 = display.newRect(display.contentCenterX + 486,580,150,10)
 netBorder3.alpha = 0
netBorder3:rotate (62)
   sceneGroup:insert( netBorder3)

netBorder4 = display.newRect(display.contentCenterX - 486,580,150,10)
 netBorder4.alpha = 0
netBorder4:rotate (-62)
   sceneGroup:insert( netBorder4)


   leftNet = display.newImageRect("Images/net1.png",150, 150)
   leftNet.x = display.contentCenterX - 450
   leftNet.y = display.contentCenterY + 200

   rightNet = display.newImageRect("Images/net2.png",150, 150)
   rightNet.x = display.contentCenterX + 450
   rightNet.y = display.contentCenterY + 200

    sceneGroup:insert( leftNet )
    sceneGroup:insert( rightNet )

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth - 910,
            y = display.contentHeight - 710,
            

            -- The pressing of the button
            defaultFile = "Images/BackButtonUnpressedNoah@2x.png",
            overFile = "Images/BackButtonPressedNoah@2x.png",

            -- Go to the main menu
            onRelease = MainMenuTransition          
        } )
        backButton.width = 200
        backButton.height = 100

        sceneGroup:insert( backButton )


         upButton = widget.newButton( 
        {   
            -- the button's location
            x = display.contentWidth/2,
            y = 700,
            

            -- 
            defaultFile = "Images/upButtonUnpressedNoah@2x.png",
            overFile = "Images/upButtonPressedNoah@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = MoveCharacterUp          
        } )
        upButton.width = 100
        upButton.height = 100

        sceneGroup:insert( upButton )

          rightButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 + 300,
            y = 700,
            

            -- Insert the images here
            defaultFile = "Images/clockwiseButtonUnpressedNoah@2x.png",
            overFile = "Images/clockwiseButtonPressedNoah@2x - Copy.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = MoveCharacterRight          
        } )
        rightButton.width = 100
        rightButton.height = 100

        sceneGroup:insert( rightButton )

          leftButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 - 300,
            y = 700,
            

            -- Insert the images here
            defaultFile = "Images/counterclockwiseButtonUnpressedNoah@2x - Copy.png",
            overFile = "Images/counterclockwiseButtonPressedNoah@2x - Copy - Copy.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = MoveCharacterLeft         
        } )
        leftButton.width = 100
        leftButton.height = 100

        sceneGroup:insert( leftButton )
    -----------------------------------------------------------------------------------------
    
    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
   



    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    
    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP

end -- function scene:create( event )   



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
                -- start physics
        physics.start()
        --Rotate()
        -- set gravity
        physics.setGravity( 0, 20 )
        Runtime:addEventListener("enterFrame", Character)
        Runtime:addEventListener("enterFrame", Character2)
        if ( soundOn == true) then
          channel = audio.play(music, {loop = -1})
        end
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
           AddPhysicsBodies()
          AddCollisionListeners()
   
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
        RemovePhysicsBodies()

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
             --RemoveCollisionListeners()
        

        physics.stop()
       -- RemoveArrowEventListeners()
        --RemoveRuntimeListeners()
       
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