push=require 'push'
Class=require 'class'
require 'Bird'
require 'Pipe'
require 'pipe_pair'
require 'StateMachine'
require 'states/BaseState'
require 'states/PlayState'
require 'states/TitleScreen'
window_width=1280
window_height=710
vlwidth=530
vlheight=304
local background=love.graphics.newImage("images/background.png")
local backgroundscroll=0
local background_speed=30
local ground=love.graphics.newImage("images/ground.png")
local groundscroll=0
local ground_speed=60
local looping_point=413
function love.load()
	love.window.setTitle("Bird");
	push:setupScreen(vlwidth,vlheight,window_width,window_height,{
		fullscreen=false,
		vsync=true,
		resizable=true
		})
	smallFont = love.graphics.newFont('font.ttf', 8)
    mediumFont = love.graphics.newFont('flappy.ttf', 14)
    flappyFont = love.graphics.newFont('flappy.ttf', 28)
    hugeFont = love.graphics.newFont('flappy.ttf', 56)
	love.graphics.setFont(flappyFont)
	math.randomseed(os.time())
	love.keyboard.keysPressed={}
	gStateMachine=StateMachine{
	['title']=function() return TitleScreen() end,
	['play']=function() return PlayState() end
	}
	gStateMachine:change('title')
end
function love.keypressed(key)
	love.keyboard.keysPressed[key]=true
	if key=='escape' then
		love.event.quit()
	end
end
function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end
function  love.update(dt)
	backgroundscroll=(backgroundscroll+background_speed*dt)%looping_point
	groundscroll=(groundscroll+ground_speed*dt)%vlwidth
	gStateMachine:update(dt) 	
	love.keyboard.keysPressed={}
end
function love.draw()
	push:start()
	love.graphics.draw(background,-backgroundscroll,0)
	love.graphics.draw(ground,-groundscroll,vlheight-16)
	gStateMachine:render()
	push:finish()
end