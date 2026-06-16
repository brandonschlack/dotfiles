require("git"):setup {
	-- Order of status signs showing in the linemode
	order = 1500,
}

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

-- Bookmarks for Yamb (Yet Another Mark) plugin
local bookmarks = {}

local path_sep = package.config:sub(1, 1)
local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
table.insert(bookmarks, {
  tag = "home",
  path = home_path .. path_sep,
  key = "~"
})
table.insert(bookmarks, {
  tag = "config",
  path = home_path .. path_sep .. ".config" .. path_sep,
  key = "c"
})

require("yamb"):setup {
  -- Optional, the path ending with path seperator represents folder.
  bookmarks = bookmarks,
  -- Optional, recieve notification everytime you jump.
  jump_notify = true,
  -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  -- Optional, the path of bookmarks
  path = (os.getenv("HOME") .. "/.config/yazi/bookmark"),
}
