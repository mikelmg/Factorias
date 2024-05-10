--Miguel Mora Gómez
-- Alt L for execute Love2d

push = require 'push'
Class = require 'class'
require 'Items/ItemA'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 640
VIRTUAL_HEIGHT = 310



timer = 0

function love.load()

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    ItemA1 = ItemA(50, 50, 'red')
    ItemA2 = ItemA(5, 50, 'yellow')


    love.keyboard.keysPressed = {}
end


function love.update(dt)

    timer = timer + dt
    ItemA1:update(dt)
    ItemA2:update(dt)


    love.draw(dt)

    love.keyboard.keysPressed = {}
end


function love.draw(dt)
    push:start()


    ItemA1:render(dt)
    ItemA2:render(dt)
    love.graphics.rectangle("fill", 0 , 50 + 10, VIRTUAL_WIDTH, 1) 

    -- pipes before ground

    push:finish()
end

--[[
    New function used to check our global input table for keys we activated during
    this frame, looked up by their string value.
]]
function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.resize(w, h)
    push:resize(w, h)
end

-- Keyboard handling, called by LÖVE2D each frame; 
-- passes in the key we pressed so we can access.
function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end
