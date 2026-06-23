-- ── Snappy workflow ────────────────────────────────────────────────

hl.config({
	decoration = {
		rounding = 0,
	},
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 1,
		layout = "dwindle",
	},
	animations = {
		enabled = false,
	},

	dwindle = {
		preserve_split = true, -- You probably want this
	},
})
