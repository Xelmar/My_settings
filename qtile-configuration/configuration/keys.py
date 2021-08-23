from typing import List

from libqtile.config import Key

from configuration.core import lazy

from .groups import groups

import const


keys: List[Key] = [
    # Manage tiling-wm
    Key([const.MOD, const.MOD_EXT], "r", lazy.restart()),
    Key([const.MOD, const.MOD_EXT], "q", lazy.shutdown()),

    # Manage tiles
    Key([const.MOD, const.MOD_EXT], "c", lazy.window.kill()),
    Key([const.MOD, const.MOD_EXT], "Tab", lazy.layout.rotate()),
    Key([const.MOD], "Tab", lazy.layout.next()),
    Key([const.MOD], "space", lazy.next_layout()),
    Key([const.MOD], "t", lazy.window.toggle_floating()),

    Key([const.MOD], "k", lazy.layout.down()),
    Key([const.MOD], "j", lazy.layout.up()),

    Key([const.MOD, const.MOD_EXT], "k", lazy.layout.shuffle_down()),
    Key([const.MOD, const.MOD_EXT], "j", lazy.layout.shuffle_up()),

    # Spawn apps
    Key([const.MOD, const.MOD_EXT], "t", lazy.spawn("urxvt")),
    Key([const.MOD, const.MOD_EXT], "Return", lazy.spawn("urxvt")),
    Key([const.MOD], "e", lazy.spawn("telegram-desktop")),
    Key([const.MOD], "s", lazy.spawn("steam")),
    Key([const.MOD], "l", lazy.spawn("xscreensaver-command -lock")),
    Key([const.MOD], "f", lazy.spawn("thunar")),
    Key([const.MOD], "w", lazy.spawn("google-chrome-stable")),
    Key([const.MOD], "v", lazy.spawn("VirtualBox")),
    Key([const.MOD, const.MOD_EXT], "s", lazy.spawn("gnome-screenshot -i")),
]


for index, group in enumerate(groups, start=1):
    str_index = str(index)
    keys.extend([
        Key([const.MOD], str_index, lazy.group[group.name].toscreen()),
        Key([const.MOD, const.MOD_EXT], str_index, lazy.window.togroup(group.name))
    ])
