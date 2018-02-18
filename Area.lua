Area = Object:extend()

function Area:new(room)
    self.room = room
    self.game_objects = {}
end

function Area:update(dt)
  if self.world then self.world:update(dt) end

  for _, game_object in ipairs(self.game_objects) do game_object:update(dt) end
end

function Area:draw()
  for _, game_object in ipairs(self.game_objects) do game_object:draw() end
end

function Area:addGameObject(game_object_type, x, y, opts)
    local opts = opts or {}
    local game_object = _G[game_object_type](self, x or 0, y or 0, opts)
    table.insert(self.game_objects, game_object)
    return game_object
end

function Area:addPhysicsWorld()
    self.world = Physics.newWorld(0, 0, true)
end
