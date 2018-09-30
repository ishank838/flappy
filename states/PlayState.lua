PlayState=Class{__input=BaseState}
Pipe_width=70
Pipe_height=288
pipe_speed=60
Bird_width=38
Bird_height=24
function PlayState:init()
	self.bird=Bird()
	self.pipe_pair={}
	self.timer=0
	self.lasty=-Pipe_height+math.random(80)+20
end
function PlayState:update(dt)
	self.timer=self.timer+dt
	 if self.timer>2 then
	 	local y=math.max(-Pipe_height+10,
	 		math.min(self.lasty+math.random(-20,20),vlheight-90-Pipe_height))
	 	table.insert(self.pipe_pair,pipe_pair(y))
	 	self.lasty=y
	 	self.timer=0
	 end
	 self.bird:update(dt)
	 for k,pipe in pairs(self.pipe_pair) do
	 	pipe:update(dt)
	 end
	 for k,pair in pairs(self.pipe_pair) do
	 	if pair.remove then
	 		table.remove(self.pipe_pair,pair)
	 	end
	 end
	 for k,pair in pairs(self.pipe_pair) do
        for l,pipe in pairs(pair.pipes) do
            if self.bird:collides(pipe) then
                gStateMachine:change('title')
            end
        end
     end
     if self.bird.y>vlheight-15 or self.bird.y<0 then
     	gStateMachine:change('title')
     end
	love.keyboard.keysPressed={}
end
function PlayState:render()
	for k,pair in pairs(self.pipe_pair) do
		pair:render()
	end
	self.bird:render()
end
function PlayState:enter()
end
function PlayState:exit()
end