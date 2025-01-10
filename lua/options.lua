require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

vim.opt.list = true
vim.opt.listchars = { tab = "--⇥", space = "·", eol = "↵", nbsp = "␣" }

-- set line number
-- vim.opt.relativenumber = true
vim.opt.number = true

-- set mouse
vim.opt.mouse = "nv"

-- tabs
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.expandtab = false

vim.opt.ruler = true
vim.opt.wrap = true

autocmd("BufReadPost", {
  pattern = "*.rej",
  command = "if filereadable(expand('%:r')) | lefta vsp ++edit %:r | endif",
})

function toggle_mouse()
  if vim.opt.mouse["_value"] == "nv" then
    vim.opt.mouse = "i"
    vim.opt.list = false
    vim.opt.number = false
    print "Set copy mode"
  else
    vim.opt.mouse = "nv"
    vim.opt.list = true
    vim.opt.number = true
    print "Exit copy mode"
  end
end
vim.keymap.set("n", "<F2>", toggle_mouse, { noremap = true, silent = true })
