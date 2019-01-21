from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

try:
    from typing import List  # noqa: F401
except ImportError:
    pass

mod = "mod4"

keys = [
	# Switch between windows in current stack pane
	Key([mod], "j", lazy.layout.down()),
	Key([mod], "k", lazy.layout.up()),
	Key([mod], "h", lazy.layout.left()),
	Key([mod], "l", lazy.layout.right()),

	# Move windows up or down in current stack
	Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
	Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
	Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
	Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

	# Switch window focus to other pane(s) of stack
	Key([mod], "space", lazy.layout.next()),

	# Swap panes of split stack
	Key([mod, "shift"], "space", lazy.layout.rotate()),

	# Toggle between split and unsplit sides of stack.
	# Split = all windows displayed
	# Unsplit = 1 window displayed, like Max layout, but still with
	# multiple stack panes
	Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
	Key([mod], "Return", lazy.spawn("termite")),

	# Toggle between different layouts as defined below
	Key([mod], "Tab", lazy.next_layout()),
	Key([mod], "q", lazy.window.kill()),

	Key([mod, "shift"], "r", lazy.restart()),
	Key([mod, "shift"], "q", lazy.shutdown()),
	Key([mod], "d",lazy.spawn("dmenu_run")), 
        Key([mod], "x", lazy.spawn("luakit")),
	Key([], "XF86AudioRaiseVolume",
	lazy.spawn("amixer sset Master 5%+")),
	Key([], "XF86AudioLowerVolume",
	lazy.spawn("amixer sset Master 5%-")),
	Key([], "XF86AudioMute",
	lazy.spawn("amixer sset Master toggle")),
]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

layouts = [
    layout.Max(),
    layout.Columns(),
    layout.Tile()
]

widget_defaults = dict(
    font='Fantasque Sans Mono',
    fontsize=20,
    padding=5,
)
extension_defaults = widget_defaults.copy()
colors=[["#171717", "#171717"], # panel background 
        ["#28252c", "#38252c"], # background for current screen tab
        ["#C0C5CE", "#C0C5CE"], # font color for group names
        ["#B48EAD", "#B48EAD"], # background color for layout widget
        ["#65737E", "#65737E"], # background for other screen tabs
        ["#859900", "#859900"], # dark green gradiant for other screen tabs
        ["#BF616A", "#BF616A"], # background color for network widget
        ["#A3BE8C", "#A3BE8C"], # background color for pacman widget
        ["#8fa1b3", "#8fa1b3"], # 
        ["#ebcb8b", "#ebcb8b"]] # background color for clock widget

screens = [ 
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active=colors[2],
                    inactive=colors[2],
                    highlight_method="block",
                    this_current_screen_border=colors[6],
                    this_screen_border=colors[4],
                    other_current_screen_border=colors[0],
                    other_screen_border=colors[0],
                    foreground=colors[2],
                    background=colors[0]
                    ),
                widget.WindowName(
                    foreground=colors[5],
                    background=colors[0]
                    ),
                widget.CurrentLayout(
                    foreground=colors[5],
                    background=colors[0]
                    ),
                widget.Systray(
                    background=colors[0]
                    ),
                widget.CheckUpdates(
                    background=colors[0],
                    foreground=colors[9]
                    ),
                widget.Clock(
                    format="%A, %B, %d - %H:%M",
                    foreground=colors[9],
                    background=colors[0]
                    ),
                widget.Volume(
                    background=colors[0],
                    foreground=colors[8]),
                widget.Battery(
                    background=colors[0]),
            ],
            28,
            opacity=0.9,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
