pipe_pair =Class{}
local gap=90
function pipe_pair:init(y)
	self.x=vlwidth+32
	self.y=y
	self.pipes={
	['upper']=Pipe('top',self.y),
	['lower']=Pipe('bottom',self.y+Pipe_height+gap)}
	self.remove=false
end
function pipe_pair:update(dt)
	if self.x>=-Pipe_width then
		self.x=self.x-pipe_speed*dt
		self.pipes['lower'].x=self.x
		self.pipes['upper'].x=self.x
	else
		self.remove=true
	end
end
function pipe_pair:render()
	for k, pipe in pairs(self.pipes) do
		pipe:render()
	end
end 