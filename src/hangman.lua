local function drawHead()
    love.graphics.translate(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 4)
    love.graphics.circle('line', 0, 0, 20)
    love.graphics.reset()
end

local function drawBody()
    love.graphics.translate(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 4)
    love.graphics.line(0, 20, 0, 80)
    love.graphics.reset()
end

local function drawArms()
    love.graphics.translate(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 4)
    love.graphics.rotate(-math.pi / 8)
    love.graphics.line(-5, 22, 0, 60)
    love.graphics.rotate(math.pi / 8 * 2)
    love.graphics.line(5, 22, 0, 60)
    love.graphics.rotate(-math.pi / 8)
    love.graphics.reset()
end

local function drawLegs()
    love.graphics.translate(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 4)
    love.graphics.rotate(-math.pi / 7)
    love.graphics.line(-100, 125, -35, 75)
    love.graphics.rotate(math.pi / 7 * 2)
    love.graphics.line(100, 125, 35, 75)
    love.graphics.reset()
end

local function drawClamp()
    love.graphics.translate(WINDOW_WIDTH / 2 + 75, WINDOW_HEIGHT / 4)
    love.graphics.line(0, -50, 0, 250)
    love.graphics.line(-10, 250, 10, 250)
    love.graphics.line(0, -50, -75, -50)
    love.graphics.line(-75, -50, -75, -30)
    love.graphics.reset()
end

Hangman = {
    head = drawHead,
    legs = drawLegs,
    arms = drawArms,
    body = drawBody,
    clamp = drawClamp
}

return Hangman
