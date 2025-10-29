require("git"):setup()

local pref_by_location = require("pref-by-location")
pref_by_location:setup({
    save_path = os.getenv("HOME") .. "/.config/yazi/pref-by-location",
    prefs = {
        -- Match any folder with name "Downloads"
        { location = ".*/Downloads", sort = { "btime", reverse = true, dir_first = false }, linemode = "btime" },
    }
})

require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}
