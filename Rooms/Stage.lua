Object = require '/libraries/classic/classic'
Stage = Object:extend()

require '/Objects/Player'

function Stage:new()
  self.area = Area(self)
  self.area:addPhysicsWorld()
  self.main_canvas = love.graphics.newCanvas(gw, gh)
  self.area:addGameObject('Player', gw/3, gh/3)
end

function Stage:update(dt)
end

function Stage:draw()
  love.graphics.setCanvas(self.main_canvas)
    love.graphics.clear()
      camera:attach()
      self.area:draw()
      camera:detach()
      camera:draw()
    love.graphics.setCanvas()


    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setBlendMode('alpha', 'premultiplied')
    love.graphics.draw(self.main_canvas, 0, 0, 0, sx, sy)
    love.graphics.setBlendMode('alpha')
end

function love.keypressed(key)
end
