-- Title: Honey Nut
-- Name: Daniel Raissi
-- Course: ICS2O/3C
-- This program will show the splash screen

-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar( display.HiddenStatusBar )

-----------------------------------------------------------------------------------------

-- Calling composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Tansitioning to the menu screen
composer.gotoScene( "level2_screen" )