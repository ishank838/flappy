Pipe=Class{}
local Pipe_image=love.graphics.newImage('images/pipe.png')
Pipe_width=70
Pipe_height=288
pipe_speed=60
function Pipe:init(orientation,y)
	self.x=vlwidth+10
	self.y=y
	self.width=Pipe_image:getWidth()
	self.height=Pipe_height
	self.orientation=orientation
end
function Pipe:update(dt)
end
function Pipe:render()
	love.graphics.draw(Pipe_image,self.x,(self.orientation=='top' and self.y+Pipe_height or self.y),
	0,1,(self.orientation=='top' and -1 or 1))
end