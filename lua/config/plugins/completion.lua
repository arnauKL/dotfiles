return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',
    opts = {
      keymap = { preset = 'default' },

      appearance = {
	-- Sets the fallback highlight groups to nvim-cmp's highlight groups
	-- Useful for when your theme doesn't support blink.cmp
	-- Will be removed in a future release
	use_nvim_cmp_as_default = true,
	-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
	-- Adjusts spacing to ensure icons are aligned
	nerd_font_variant = 'mono'
      },

      signature = { enabled = true },

      -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
  }
}
