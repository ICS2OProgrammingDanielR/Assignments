-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a math question and asks th user to answer in a numeric textfield.
--------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault("background", 255/255, 102/255, 255/255)

--------------------------------------------------------------------------
-- LOCAL VARIALES
--------------------------------------------------------------------------

-- create local variables
local questionObject
local clockText
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local correctAnswer1
local pointsCount = 0
local livesCount = 4
local pointsText
local totalSeconds = 10 
local secondsLeft = 10
local randomOperator
local heart1
local heart2
local heart3
local heart4
local incorrectObject
local livesText

---------------------------------------------------------------------------------
-- SOUNDS
------------------------------------------------------------------------------

local correctSound = audio.loadSound( "sounds/correctSound.mp3" )
local correctSoundChannel
local incorrectSound = audio.loadSound( "sounds/incorrectSound.mp3" )
local incorrectSoundChannel

--------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 15)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in the text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- generate a random number between 1 and 2
	randomOperator = math.random(1,3)

	-- if the random operator is 1 do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
	    questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	    
	-- if 2 multiplication
	elseif (randomOperator == 2) then
        -- calculate the correct answer
        correctAnswer = randomNumber1 * randomNumber2

        -- create question in text object
        questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
    -- if 3 divition
    elseif ( randomOperator == 3) then
    	-- calculate the correct answer
    	correctAnswer1 = randomNumber1 * randomNumber2
        correctAnswer = correctAnswer1 / randomNumber1

        -- create question in text object
        questionObject.text = correctAnswer1 .. " / " .. randomNumber2 .. " = "
    end
end




local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end


local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- user begins editing
	if ( event.phase == "began" ) then

		-- clear text 
		event.target.text =  ""

	elseif (event.phase == "submitted") then
		userAnswer = tonumber(event.target.text)

		-- when answer is submitted set user input to user's answer
		if (userAnswer == correctAnswer) then
			incorrectObject.isVisible = false
			correctObject.isVisible = true
			timer.performWithDelay(1000, HideCorrect)
			event.target.text = ""
			pointsCount = pointsCount + 1
			pointsText.text = "Points = " .. pointsCount
			correctSoundChannel = audio.play(correctSound)
			secondsLeft = 10
			if (points == 5) then

				-- hide everything
				incorrectObject.isVisible = false
				correctObject.isVisible = false
				numericField.isVisible = false
				questionObject.isVisible = false
				pointsText.isVisible = false
				clockText.isVisible = false
				EndTimer()
				bkg.isVisible = false
				--display you win
				winObject.isVisible = true
				local winBkg = display.newImageRect("Images/winBkg.png", display.contentWidth, display.contentHeight)
				local winSound = audio.loadSound("Sounds/clappingSound.aud")
				local correctSoundChannel
				winBkg.x = display.contentCenterX
				winBkg.y = display.contentCenterY
			end

		else
		    incorrectObject.isVisible = true
		    correctObject.isVisible = false
		    timer.performWithDelay(2000, HideIncorrect)
		    event.target.text = ""
		    if (lives == 3) then
		    	heart4.isVisible = false
		    elseif (lives == 2) then
		    	heart3.isVisible = false
		    elseif (lives == 1) then
		    	heart2.isVisible = false
            elseif (lives == 0) then
		    	heart1.isVisible = false
		    end
		    secondsleft = 10
		    wrongSoundChannel = audio.play(wrongSound)
		end
	end
end


	
local function UpdateTime()

	-- get rid of secondsLeft
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		-- if no lives left play lose sound show lose image and get rid of timer
		if (lives == 2) then
		heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		end
	end
end

--------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------

-- displays a question and sets the color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(0/255, 128/255, 255/255)

-- create the correct text objest and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0/255, 128/255, 255/255)
correctObject.isVisible = false



-- create the correct text objest and make it invisible
incorrectObject = display.newText( "Incorrect, try again", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(0/255, 128/255, 255/255)
incorrectObject.isVisible = false

numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. pointsCount, 850, 40, nil, 50)

-- display the amount of points as a text object
livesText = display.newText("Lives left = " .. livesCount, 150, 40, nil, 50)

-- create the hearts 
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7
--------------------------------------------------------------------------
-- FUNCTION CALLS
--------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()