require('src.game')

-- named imports..
Hangman = require('src.hangman')

key = ''
description = ''
highlighted = ''

function love.load()
    math.randomseed(os.time(), os.time())

    WINDOW_WIDTH, WINDOW_HEIGHT = love.graphics.getDimensions()

    big = love.graphics.newFont('fonts/Montserrat-Black.ttf', 20)
    normal = love.graphics.newFont('fonts/Montserrat-Regular.ttf', 16)
    light = love.graphics.newFont('fonts/Montserrat-Light.ttf', 30)

    g = Game()
    g.init()
    description = g.get_hint()
end

function love.keypressed(k)
    -- here to prevent life loss and updation of state if miscellanious key such as space, enter, escape are pressed
    if (#k == 1) then
        key = k
        g.update(k)
    end

    if (k == 'escape') then
        love.event.quit()
    end
end

frames = 0
function love.draw()
    -- cleanup
    love.graphics.clear()

    -- get current game state
    state = g.get_state()
    width, height = love.graphics.getDimensions()

    if ev == events.GAME_LOST then
        love.graphics.printf("You Lost!", big, 0, height / 2, width, 'center')
        love.graphics.printf("Press escape to exit", normal, 0, height / 2 + 60, width, 'center')
        return
    end

    if ev == events.GAME_WON then
        love.graphics.printf("You WON!", big, 0, height / 2, width, 'center')
        love.graphics.printf("Press escape to exit", normal, 0, height / 2 + 60, width, 'center')
        return
    end

    if ev == events.DEC_LIVES then
        frames = 50
    end

    -- lives left
    love.graphics.setFont(big)
    love.graphics.print(g.get_lives() .. ' Lives Left', 600, 40)

    ev = g.poll()

    -- -1 text rendering..
    if frames > 0 then
        love.graphics.setFont(big)
        love.graphics.setColor(1, 0, 0)

        love.graphics.printf('-1', 600, 10, 100, 'center')

        -- do animation stuff
        frames = frames - 1
        g.reset_ev()
    end

    -- reset to white..
    love.graphics.setColor(1, 1, 1)

    -- show hangman figure..
    lives = g.get_lives()

    if lives == 0 then
        Hangman.legs()
    end
    if lives <= 1 then
        Hangman.arms()
    end
    if lives <= 2 then
        Hangman.body()
    end
    if lives <= 3 then
        Hangman.head()
    end
    if lives <= 4 then
        Hangman.clamp()
    end

    -- showing dashes nd text according to game state.
    love.graphics.setFont(normal)
    start, diff_x = 200, 400
    diff = (diff_x / #state)
    for i = 1, #state do
        love.graphics.print(state:sub(i, i), start - 20 + diff * i, 450)
    end

    -- description
    love.graphics.printf(description, start, 480, diff_x, 'center')
end
