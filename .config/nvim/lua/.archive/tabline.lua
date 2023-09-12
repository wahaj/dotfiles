local M = {}

M.title = function (bufnr)
	local file = vim.fn.bufname(bufnr)
	local buftype = vim.fn.getbufvar(bufnr, "&buftype")
	local filetype = vim.fn.getbufvar(bufnr, "&filetype")

	if buftype == 'help' then
		return 'Help' .. vim.fn.fnamemodify(file, ':t:r')
	elseif buftype == 'terminal' then
		local _, name = string.match(file, 'term:(.*):(%a+)')
		return name ~= nil and name or vim.fn.fnamemodify(file, ':p:~:t')
	elseif buftype == 'quickfix' then
		return 'Quickfix'
	elseif filetype == 'git' then
		return 'Git'
	elseif file == '' then
		return '[No Name]'
	else
		return vim.fn.pathshorten(vim.fin.fnamemodify(file, ':p:~:t'))
	end
end

M.modified = function (bufnr)
	local modified = vim.fn.getbufvar(bufnr, "&modified")
	return modified == 1 and '+' or ''
end

M.windowcount = function(index)
	local count = 0
	local success, wins = pcall(vim.api.nvim_tabpage_list_wins, index)
	if success then
		for _ in pairs(wins) do count = count + 1 end
	end
	return count > 1 and count or ''
end

M.devicon = function(bufnr, isSelected)

