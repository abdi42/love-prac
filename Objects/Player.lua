require '/Objects/GameObject'
Player = GameObject:extend()

function Player:new(area, x, y, opts)
  Player.super.new(self, area, x, y, opts)

  self.x, self.y = x, y
  self.w, self.h = 12, 12
  self.collider = self.area.world:newCircleCollider(self.x, self.y, self.w)
  self.collider:setObject(self)


  self.r = -math.pi/2
  self.rv = 1.66*math.pi
  self.v = 0
  self.max_v = 100
  self.a = 100  
end

function Player:update()

end

function Player:draw()
  love.graphics.circle('line', self.x, self.y, self.w)
end
