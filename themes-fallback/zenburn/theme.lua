-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}
theme.wallpaper_cmd = { "awsetbg " .. os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/zenburn-background.png" }
-- }}}

-- {{{ Styles
if config['font'] then
    theme.font          = config['font'] 
else
    theme.font          = "sans 8"
end

if config['tag_font'] then
    theme.taglist_font = config['tag_font']
end

theme.widget_cpu    = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/cpu.png"
theme.widget_bat    = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/bat.png"
theme.widget_mem    = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/mem.png"
theme.widget_fs     = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/disk.png"
theme.widget_net    = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/down.png"
theme.widget_netup  = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/up.png"
theme.widget_mail   = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/mail.png"
theme.widget_vol    = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/vol.png"
theme.widget_org    = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/cal.png"
theme.widget_date   = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/time.png"
theme.widget_crypto = os.getenv("HOME") .. "/.config/awesome/themes-fallback/zenburn/icons/crypto.png"
theme.widget_wifi   = os.getenv("HOME") .. "/.config/awesome/themes-fallback/default/icons/wifi.png"
theme.widget_rss    = os.getenv("HOME") .. "/.config/awesome/themes-fallback/default/icons/rss.png"

-- {{{ Colors
theme.fg_normal = "#DCDCCC"
theme.fg_focus  = "#F0DFAF"
theme.fg_urgent = "#CC9393"
theme.bg_normal = "#3F3F3F"
theme.bg_focus  = "#1E2320"
theme.bg_urgent = "#3F3F3F"
-- }}}

-- {{{ Borders
theme.border_width  = "2"
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "100"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/awesome-icon.png"
theme.menu_submenu_icon      = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/default/submenu.png"
theme.tasklist_floating_icon = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/default/tasklist/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/tile.png"
theme.layout_tileleft   = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/tileleft.png"
theme.layout_tilebottom = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/tilebottom.png"
theme.layout_tiletop    = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/tiletop.png"
theme.layout_fairv      = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/fairv.png"
theme.layout_fairh      = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/fairh.png"
theme.layout_spiral     = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/spiral.png"
theme.layout_dwindle    = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/dwindle.png"
theme.layout_max        = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/max.png"
theme.layout_fullscreen = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/fullscreen.png"
theme.layout_magnifier  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/magnifier.png"
theme.layout_floating   = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = os.getenv("HOME") .. "/.config/awesome" .. "/themes-fallback/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
