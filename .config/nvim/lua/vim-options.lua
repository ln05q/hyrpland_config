-- [[       MY VIM OPTIONS      ]] --


vim.cmd("set cursorline")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set nowrap")
vim.cmd("set linebreak")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set nobackup")
vim.cmd("set nowritebackup")
vim.cmd("set noswapfile")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set updatetime=100")



--[[        SHOW DIAGNOSTICS MESSAGES       ]]-- 

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = "● ",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

--[[
vim.diagnostic.config({
    virtual_text=true,
virtual_lines = false,
	signs = true,
	underline = false,
	update_in_insert = false,
	severity_sort = true,
})
]]
