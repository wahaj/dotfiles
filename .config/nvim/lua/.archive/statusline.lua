-- NVIM Custom Statusline
--
-- Author: Wahaj Javed (wahaj)
--

local devicons = require('devicons')
local _mode = require('statusline/mode')
M = {}

-- Define the shortcuts
local api = vim.api
local cmd = api.nvim_command
local fn = vim.fn


-- Define the branch function
function branch()
    local branch = vim.fn['fugitive#head()'](1)
    if vim.fn.empty(branch) == 1 then
        return ''
    end
    return '' .. branch 
end

-- Define the filename function
local function fileinfo()
    local file = vim.fn.expand('%:t')
    if vim.fn.empty(file) == 1 then
        return ''
    end
    if vim.bo.readonly == true then
        return file .. ' [RO]'
    end
    if vim.bo.modifiable == false then
        return file .. ' [RO]'
    end
    if vim.bo.modified == true then
        return file .. ' [+]'
    end
    return file
end

-- Define the statusline branch function
local function statusline_branch()
    cmd('hi! GitBranchSeparator guifg=grey guibg=01 cterm=bold')
    cmd('hi! GitBranch guifg=#ffffff guibg=grey cterm=bold')
    
    statusline = {
        '%#GitBranchSeparator#',  -- Start the git branch block
        '',
        '%#GitBranch#',
        '%{FugitiveHead()}',

        '%#GitBranchSeparator#',
        ' ',                      -- End the git branch block  
    }
    return table.concat(statusline)
end

vim.api.nvim_exec(
[[
hi! PrimaryBlock guifg=#008080 guibg=01 cterm=bold
hi! SecondaryBlock ctermfg=08 ctermbg=00 cterm=bold
hi! TreeSitterBlock guifg=grey guibg=01 cterm=bold
hi! TreeSitterSeparator guifg=01 guibg=01 cterm=bold
hi! PercentBlock guifg=04 guibg=07 cterm=bold
hi! Blanks ctermfg=02 ctermbg=00
hi! ColumnBlock guifg=slateblue guibg=09 gui=bold
]], false)


function M.statusline_active()
    local stl = {}
    local mode = api.nvim_get_mode().mode
    stl = {
        '', -- Clear the statusline
        '%#ColumnBlock#',
        '%5c', -- Column number
        '%#PrimaryBlock#',
        _mode.statusline_mode(),
        statusline_branch(),
        '%#SecondaryBlock#',
        '%#Blanks#',
        '%=', -- Left align
   --     '%#TreeSitterSeparator#',
        '%#TreeSitterBlock#',
        '%{nvim_treesitter#statusline(60)}', -- Treesitter
    --    '%#TreeSitterSeparator#',
        '%#Blanks#',
        '%=', -- Right align
        '%160#PrimaryBlock# ',
        fileinfo(), -- File Info 
        '%m', -- Modified
        ' ',
        devicons.filename_to_icon(fileinfo()) or '', -- File Icon
        ' %3p%%', -- Percentage through file
    }
    return table.concat(stl)
end

-- Set the statusline
vim.o.statusline = M.statusline_active()
return M
