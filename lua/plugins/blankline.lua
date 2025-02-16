vim.opt.list = true
vim.opt.listchars:append "eol:↴"

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
}
