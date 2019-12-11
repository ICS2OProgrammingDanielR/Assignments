-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")


-----------------------------------------------------------------------------------------

-- scene name
sceneName = "level2_Question"

-----------------------------------------------------------------------------------------

local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
numCorrect = 0


-- varribles
local questionText
local answerText1 
local wrongAnswerText1
local wrongAnswerText2
local wrongAnswerText3
local answerPosition = 1
local bkg
local cover
local X1 = display.contentWidth*2/7 + 50
local X2 = display.contentWidth*4/7 + 50
local Y1 = display.contentHeight*1/2 + 50
local Y2 = display.contentHeight*5.5/7 + 50


local userAnswer
local textTouched = false
local answerBox
local answerBox2
local answerBox3
local answerBox4
local questionBox
local firstNumber
local question2Image

local selectSound = audio.loadStream("Sounds/cheer.mp3")
local selecSoundChannel
 





-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
local function BackToLevel1() 
    

composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})

          
    ResumeGame()
end 

local function BackToLevel12() 
    

composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})

          
    ResumeGame2()
end 
-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText1.text
    numCorrect = numCorrect + 1
    selecSoundChannel = audio.play(selectSound)
    if (touch.phase == "ended") then

        BackToLevel1( )
    
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongText1.text
    selecSoundChannel = audio.play(selectSound)
    if (touch.phase == "ended") then
        
        BackToLevel12( )
        
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    selecSoundChannel = audio.play(selectSound)
    if (touch.phase == "ended") then

        BackToLevel12( )
        
    end 
end

-- checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
    selecSoundChannel = audio.play(selectSound)
    
    if (touch.phase == "ended") then

        BackToLevel12( )
        
    end 
end
--adding the event listeners 
local function AddTextListeners()
    answerText1:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners
local function RemoveTextListeners()
    answerText1:removeEventListener( "touch", TouchListenerAnswer)
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end
local function Question2( )
  
    question2Image.isVisible = true

end

local function DisplayQuestion()
    --creating random numbers
    firstNumber = math.random (1,3)
   

if (firstNumber == 1) then

    --creating the question depending on the selcetion number
    questionText.text = " What do the leaves of a plant do? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Collect energy "
    
    --creating wrong answers
    wrongText1.text = " Support the plant "
    wrongText2.text = " Carry the nutrients "
    wrongText3.text = " Carry the water "
elseif (firstNumber == 2)then
     
    Question2()
     --creating the question depending on the selcetion number
    questionText.text = " What is this? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Stem "
    
    --creating wrong answers
    wrongText1.text = " Root "
    wrongText2.text = " Leaf "
    wrongText3.text = " Seed "
elseif (firstNumber == 3)then
     --creating the question depending on the selcetion number
    questionText.text = " What is Photosynthesis? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Plants making Food "
    
    --creating wrong answers
    wrongText1.text = " Animals eating plants "
    wrongText2.text = " A species of plant "
    wrongText3.text = " A flower "
end

end

local function PositionAnswers()

    --creating random start position in a cretain area
    answerPosition = math.random(1,3)

    if (answerPosition == 1) then

        answerText1.x = X1
        answerText1.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
    elseif (answerPosition == 2) then

        answerText1.x = X1
        answerText1.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2


    elseif (answerPosition == 3) then

        answerText1.x = X2
        answerText1.y = Y1
            
        wrongText1.x = X1
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2
            
    end


end

-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth + 0.95, display.contentHeight*0.95, 50 )
    cover:setFillColor(255/255, 255/255, 255/255)
    cover.strokeWidth = 9
    cover:setStrokeColor( 255/255, 0/255, 0/255)
    
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)

    question2Image = display.newImageRect("Images/WhatIsRoot.png", 200, 500)
    question2Image.x = display.contentWidth/2 - 380
    question2Image.y = display.contentHeight/2 + 50
    question2Image.strokeWidth = 9
    question2Image:setStrokeColor(255/255, 255/255, 51/255)
    question2Image.isVisible = false


    answerBox = display.newRect(display.contentCenterX - 90, 650, 300, 60)
    answerBox.strokeWidth = 9
    answerBox:setStrokeColor(255/255, 255/255, 51/255)
     answerBox:setFillColor(0, 1, 0)

    answerBox2 = display.newRect(display.contentCenterX - 90, 430, 300, 60)
    answerBox2.strokeWidth = 9
    answerBox2:setStrokeColor(255/255, 255/255, 51/255)
     answerBox2:setFillColor(0, 1, 0)

    answerBox3 = display.newRect(display.contentCenterX + 250, 650, 280, 60)
    answerBox3.strokeWidth = 9
    answerBox3:setStrokeColor(255/255, 255/255, 51/255)
     answerBox3:setFillColor(0, 1, 0)

    answerBox4 = display.newRect(display.contentCenterX + 250, 430, 280, 60)
    answerBox4.strokeWidth = 9
    answerBox4:setStrokeColor(255/255, 255/255, 51/255)
     answerBox4:setFillColor(0, 1, 0)
    sceneGroup:insert(answerBox)
    sceneGroup:insert(answerBox2)
    sceneGroup:insert(answerBox3)
    sceneGroup:insert(answerBox4)
    sceneGroup:insert(question2Image)

    
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 55)
    questionText:setFillColor(0/255, 0/255, 0/255)
    answerText1 = display.newText("", X1, Y2, Arial, 25)
    answerText1.anchorX = 0
    answerText1:setFillColor(0/255, 0/255, 0/255)
    wrongText1 = display.newText("", X2, Y2, Arial, 25)
    wrongText1.anchorX = 0
    wrongText1:setFillColor(0/255, 0/255, 0/255)
    wrongText2 = display.newText("", X1, Y1, Arial, 25)
    wrongText2:setFillColor(0/255, 0/255, 0/255)
    wrongText2.anchorX = 0
    wrongText3 = display.newText("", X2, Y1, Arial, 25)
    wrongText3.anchorX = 0
    wrongText3:setFillColor(0/255, 0/255, 0/255)


    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText1)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)
  



end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        AddTextListeners()

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        DisplayQuestion()
        PositionAnswers()
        


        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveTextListeners()
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

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



-----------------------------------------------------------------------------------------

return scene