Object = require '/libraries/classic/classic'
Timer = require 'libraries/hump/timer'

HealthBar = Object:extend()


function HealthBar:new(frameWidth,frameX,frameY)
  timer = Timer()
  reset = false
  initWidth = frameWidth
  health = frameWidth
  self.x = (gw/3)
  self.y = (gh/3)

  rect = {width = frameWidth ,height = frameWidth * 0.20}
  backgroundRect = {width = frameWidth ,height = frameWidth * 0.20}
end

function HealthBar:update(dt)
  timer:update(dt)
  if backgroundRect.width < 1 and reset == false then
    reset = true
    timer:tween(0.8, rect, {width = initWidth}, 'in-out-cubic',function()
      reset = false
      health = initWidth
    end)
    timer:tween(0.5, backgroundRect, {width = initWidth}, 'in-out-cubic')
  end
end

function HealthBar:damage(dmg)
  if health > dmg - 1 then
    health = health - dmg
    timer:tween(0.4, rect, {width = rect.width - dmg}, 'in-out-cubic')
    timer:tween(0.8, backgroundRect, {width = backgroundRect.width - dmg}, 'in-out-cubic')
  end
end

function HealthBar:draw()
  love.graphics.setColor(209, 35, 35)
  love.graphics.rectangle('fill', self.x, self.y, backgroundRect.width,backgroundRect.height,5,5)

  love.graphics.setColor(255,69,78)
  love.graphics.rectangle('fill', self.x, self.y, rect.width,rect.height,5,5)
end
