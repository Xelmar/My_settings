from libqtile.config import Drag, Click

from configuration.core import lazy
import const


# Drag floating layouts.
mouse = [Drag([const.MOD], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
         Drag([const.MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
         Click([const.MOD], "Button2", lazy.window.bring_to_front())]

