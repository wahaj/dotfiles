M = {}

local cmd = vim.cmd

-- Define colors
local colors = {
    bg = '#000000',
    fg = '#ffffff',
    yellow = '#ffff00',
    cyan = '#00ffff',
    darkblue = '#081633',
    normal = '#008080',
    green = '#00ff00',
    orange = '#ff8000',
    violet = '#ee82ee',
    magenta = '#ff00ff',
    blue = '#5fafff';
    red = '#ff0000'
}

-- Define the statusline mode map
local mode_map = {
    ['n'] = 'N',
    ['no'] = 'N',
    ['V'] = 'V L',
    ['v'] = 'V',
    ['s'] = 'S',
    ['S'] = 'S',
    ['i'] = 'I',
    ['ic'] = 'I',
    ['R'] = 'R',
    ['Rv'] = 'Rv',
    ['c'] = 'C',
    ['cv'] = 'VEx',
    ['ce'] = 'Ex',
    ['r'] = 'prompt',
    ['rm'] = 'more',
    ['r?'] = 'confirm',
    ['!'] = '!',
    ['t'] = '#'
}

-- Get the current mode
local function mode()
    local m = vim.api.nvim_get_mode().mode
    if mode_map[m] == nil then
        return m
    end
    return mode_map[m]
end

function get_mode_color(mode)

    local current_mode = vim.api.nvim_get_mode().mode
    
    if current_mode == 'n' then
        return colors.normal
    elseif current_mode == 'i' then
        return colors.blue
    elseif current_mode == 'v' or current_mode == 'V' or current_mode == 's' then
        return colors.yellow
    elseif current_mode == 'c' or current_mode == 'cv' or current_mode == 'ce' then
        return colors.red
    elseif current_mode == 't' then
        return colors.magenta
    else
        return colors.green
    end
end

function set_mode_colors()
    local mode_color = get_mode_color()
    local modeblock = {
        'hi! ModeBlock guifg=01',
        ' guibg=',
        mode_color,
        ' gui=bold'
    }
    cmd(table.concat(modeblock)) -- Set the mode block highlight group
    local modeblock_separator = {
        'hi! ModeBlockSeparator guifg=',
        mode_color,
        ' guibg=01 gui=bold'
    }
    cmd(table.concat(modeblock_separator)) -- Set the mode block separator highlight group
    return ''
end


-- Define the statusline mode function
function M.statusline_mode()

    local mode = mode()
    set_mode_colors()
    statusline = {
        ' %#ModeBlockSeparator#',
        '%#ModeBlock# ',
        --'%{set_mode_colors()}',
        '%{toupper(mode())}',
        ' %#ModeBlockSeparator# '
    }
    return table.concat(statusline)
end

return M
