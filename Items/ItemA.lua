ItemA = Class{}

local upSize = 0

ITEM_VELOCITY = 20

function ItemA:init(x, y, color)
    self.x = x
    self.y = y

    if color == 'yellow' then
        self.r = 0.969
        self.g = 0.953
        self.b = 0.027
    elseif color == 'red' then
        self.r = 1
        self.g = 0
        self.b = 0.027
    else
        self.r = 0
        self.g = 0
        self.b = 1
    end

end


function ItemA:update(dt)
    self.x = self.x +ITEM_VELOCITY*dt
end


function ItemA:render(dt)


    upSize = 4*math.sin( timer*2 ) 

    love.graphics.setColor(self.r, self.g, self.b)
    love.graphics.rectangle("fill", self.x-upSize/2 , self.y-upSize/2, 20 + upSize, 20+upSize) 
end