Bird=Class{}
local grav=20
function Bird:init()
	self.image=love.graphics.newImage('images/bird.png')
	self.width=self.image:getWidth()
	self.height=self.image:getHeight()
	self.x=vlwidth/2-self.width/2
	self.y=vlheight/2-self.height/2
	self.dy=0
end
function Bird:render()
	love.graphics.draw(self.image,self.x,self.y)
end
function Bird:update(dt)
	self.dy=self.dy+grav*dt
	if love.keyboard.wasPressed("up") then
		self.dy=-5
	end
	self.y=self.y+self.dy
end
function Bird:collides(pipe)
	if self.x+self.width-7>=pipe.x and self.x-2<=pipe.x+Pipe_width then
		if self.y+3<=pipe.y+Pipe_height and self.y+self.width>=pipe.y+15 then
			return true
		end
	else
		return false
	end
end