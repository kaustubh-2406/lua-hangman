require('src.info')

function Game()
    local lives = 5
    local state = ''
    local current = ''

    local event = ''

    function init()
        rnd = math.random(#langs)
        current = langs[rnd]
        state = string.rep('_', #current)
    end

    function get_state()
        return state
    end

    function get_hint()
        return hints[current]
    end

    function get_lives()
        return lives
    end

    function get_ans()
        return current
    end

    function update(key)
        if string.find(current, key) == nil then
            -- reduce one live..
            lives = lives - 1
            event = events.DEC_LIVES
        else
            -- show all the occurance of the pressed key..
            for i = 1, #current do
                -- get current character.. 
                char = string.sub(current, i, i)

                -- check for equality with character... if found replace them..
                if char == key then
                    state = string.sub(state, 1, i - 1) .. char .. string.sub(state, i + 1)
                end
            end
        end

        if lives == 0 then
            event = events.GAME_LOST
            return
        end

        if state == current then
            event = events.GAME_WON
            return
        end

    end

    function poll()
        return event
    end

    function reset_ev()
        event = ''
    end

    return {
        init = init,
        poll = poll,
        update = update,

        reset_ev = reset_ev,

        get_ans = get_ans,
        get_hint = get_hint,
        get_state = get_state,
        get_lives = get_lives,
        get_ans_len = get_ans_len
    }
end

