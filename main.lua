require './AutoLoader'
require './utils'
require './Area'
Physics = require './libraries/windfield/windfield'
Camera = require '/objects/Camera'
Timer = require 'libraries/hump/timer'

function love.load()
    resize(3)
    camera = Camera(160, 90, 480, 270)
    camera:setFollowStyle('LOCKON')
    current_room = nil

    AutoLoader():load('Objects')
    AutoLoader():load('Rooms')
    gotoRoom('Stage')
end

function love.update(dt)
    if current_room then current_room:update(dt) end
    camera:update(dt)
end

function love.draw()
    if current_room then current_room:draw() end
end

function resize(s)
    love.window.setMode(s*gw, s*gh)
    love.graphics.setDefaultFilter('nearest')
    love.graphics.setLineStyle('rough')
    sx, sy = s, s
end

function gotoRoom(room_type, ...)
    current_room = _G[room_type](...)
end
