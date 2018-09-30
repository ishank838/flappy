TitleScreen=Class{__includes=BaseState}
function TitleScreen:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateMachine:change('play')
	end
end
function TitleScreen:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Flappy Bird', 0, 64, vlwidth, 'center')
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter', 0, 100, vlwidth, 'center')
end