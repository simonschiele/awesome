-- path
config_dir = os.getenv("HOME") .. "/.config/awesome"
package.path = package.path .. ";" .. config_dir .. "/lib/?/init.lua;" .. config_dir .. "/lib/?;" .. config_dir .. "/lib/?.lua"

-- Standard awesome library
require('awful')
require('awful.autofocus')
require('awful.rules')

-- Theme handling library
require('beautiful')

-- Notification library
require('naughty')

-- Load applications for menu and default variables
require('applications')

-- Load lib/tools.lua, a few helper and functions this config needs to work
require('tools')


-- {{{ config stuff 

-- Don't change config values here!!! Create myconfig.lua and overwrite config there!
-- Possible config settings are well documented in the myconfig.lua-example

application_config = {}
-- autostart_config = {}
config = {}
config['modkey'] = "Mod4"
config['altkey'] = "Mod1"
config['main_screen'] = 1 

if exists(config_dir .. "/myconfig.lua") then
    require("myconfig")
end

modkey = config['modkey']
altkey = config['altkey']
-- }}}

-- {{{ Set Theme
if not config['theme'] then
    config['theme'] = "default"
end
theme = config_dir .. '/themes/' .. config['theme'] .. '/theme.lua'

if not exists(theme) then
    theme = "/usr/share/awesome/themes/default/theme.lua" 
end

beautiful.init(theme)
-- }}}

-- {{{ Layouts 
-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    if config['tag_style'] == 'fancy' then
        tagnames = {"⚡","✇","☭","⌥","⌤","⍜","⌘","☼","☠"}
    elseif config['tag_style'] == 'greek' then
        tagnames = {"λ","Ω","Δ","ε","ϰ","Ϭ","Ψ","Φ","ϖ"}
    else
        tagnames = {"1","2","3","4","5","6","7","8","9"}
    end
    if not config['tag_count'] then
        config['tag_count'] = 6 
    end
    for i = 0, 8 - config['tag_count'] do
        table.remove(tagnames)
    end
    tags[s] = awful.tag(tagnames, s)
end
-- }}}

-- {{{ Menu
mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = get_mainmenu() })
-- }}}

-- {{{ Separators
spacer    = widget({ type = "textbox", name = "spacer" })
dspacer   = widget({ type = "textbox", name = "dspacer" })
separator = widget({ type = "textbox", name = "separator" })
spacer.text     = " "
dspacer.text    = "  "
separator.text  = "|"               -- " syntaxhighlite-fix
-- }}}

-- {{{ Obvious 
if config['obvious_clock'] then
    require('obvious.clock')
    obvious.clock.set_editor(editor_cmd)
    obvious.clock.set_shorttimer(1)
    obvious.clock.set_shortformat(function () return " <b>%X</b>" end)
    obvious.clock.set_longformat(function () return " <b>%a %b %d, %T </b> " end)
end
-- }}}

-- {{{ Vicious 
if config['vicious'] then
    require('lib/vicious')
end
-- }}}

-- {{{ Bashets 
if config['bashets'] then
    require('lib/bashets')
end
-- }}}

-- {{{ Flaw
if config['flaw'] then
    require('lib/flaw')
end
-- }}}

-- {{{ Awesompd
if config['awesompd'] then
    require('lib/awesompd')
end
-- }}}

-- {{{ Wibox
-- Create a textclock widget
if config['obvious_clock'] then
    textclock = obvious.clock()
else
    textclock = awful.widget.textclock({ align = "right" })
end

-- Create a systray
systray = widget({ type = "systray" })

-- Different Boxes 
mywibox = {}
mypromptbox = {}
mylayoutbox = {}

-- Create Taglist
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )

-- Create Tasklist
if config['taskbar'] == 'bottom' then
    mytaskbox = {}
end
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        s == config['main_screen'] and textclock or nil,
        s == config['main_screen'] and systray or nil,
        config['taskbar'] ~= 'bottom' and config['taskbar'] ~= 'off' and dspacer,
        config['taskbar'] ~= 'bottom' and config['taskbar'] ~= 'off' and mytasklist[s],
        
        layout = awful.widget.layout.horizontal.rightleft
    }
    
    if config['taskbar'] == 'bottom' then
        mytaskbox[s] = awful.wibox({ position = "bottom", screen = s })
        mytaskbox[s].widgets = {
            mytasklist[s],
            layout = awful.widget.layout.horizontal.leftright
       }
    end
end
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    -- client focus
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),
    awful.key({ altkey,           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey,           }, "a", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),

    -- Quit/Restart/Redraw Awesome
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Control" }, "q", awesome.quit),
    awful.key({ modkey, "Shift"   }, "r", function (c) c:redraw() end),

    -- Standard program
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt / Exec Applications
    awful.key({ modkey }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey }, "e", function () mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey }, "s",
            function ()
                awful.prompt.run({ prompt = "SSH: " },
                mypromptbox[mouse.screen].widget,
                function (s)
                    awful.util.spawn(terminal_exec .. "ssh -vvv " .. s)
                end)
            end), 


    awful.key({ modkey }, "F12", function () awful.util.spawn(screen_lock) end),

    awful.key({ modkey }, "F2",
            function ()
                awful.prompt.run({ prompt = "Run Lua code: " },
                mypromptbox[mouse.screen].widget,
                awful.util.eval, nil,
                awful.util.getdir("cache") .. "/history_eval")
            end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f", function (c) c.fullscreen = not c.fullscreen end),
    awful.key({ modkey,           }, "x", function (c) c:kill() end),
    awful.key({ modkey, "Shift"   }, "x", function () awful.util.spawn('xkill') end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n", function (c) c.minimized = true end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ altkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize),
    awful.button({ altkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () menu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Rules

if not awful.rules.rules then
    awful.rules.rules = {}
end

joinTables(awful.rules.rules,{
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
})
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- if application_config[c.pid] ~= nil then
    --    if application_config[c.pid].screen ~= nil then
    --        c.screen = application_config[c.pid].screen
    --    end
    --    if application_config[c.pid].tag ~= nil then
    --        c:tags({ screen[c.screen]:tags()[application_config[c.pid].tag] })
    --    end
    -- end
    
    if config['titlebar'] then
        awful.titlebar.add(c, { modkey = modkey })
    end

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
    
    c.size_hints_honor = false
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Autostart
if autostart_config ~= nil then
    autostart(autostart_config)
end
-- }}}

