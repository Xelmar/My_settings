from libqtile import bar
from libqtile.config import Screen

from .widgets import widgets_top, widgets_bot


_background = "#483D8B.50"

screens = [Screen(x=0,
                  top=bar.Bar(widgets_top, 24, background=_background),
                  bottom=bar.Bar(widgets_bot, 24, background=_background))]
