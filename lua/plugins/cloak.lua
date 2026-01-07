return {
	"laytan/cloak.nvim",
	enabled = true,
	ops = {
		cloak_character = "*",
		highlight_group = "Comment",
		patterns = {
			{
				file_pattern = {
					"wrangler.toml",
					".dev.vars",
				},
				cloak_pattern = "=.+",
			},
		},
	},
	config = function(_, opts)
		require('cloak').setup(opts)
	end,
}

