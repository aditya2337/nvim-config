return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	ops = {
		ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
	config = function(_, opts)
		local ok, configs = pcall(require, 'nvim-treesitter.configs')
		if not ok then return end
		configs.setup(opts)
	end,
}

