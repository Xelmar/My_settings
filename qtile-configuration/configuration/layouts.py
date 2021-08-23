from libqtile import layout

layouts = [
    layout.Max(name="[M]"),
    layout.Columns(name="[C]",
                   num_columns=3,
                   border_focus="#ff8c00",
                   ratio=0.7,
                   margin=6)
]

"""
    layout.MonadTall(name="[T]",
                     border_focus="#ff8c00",
                     ratio=0.7,
                     margin=6),
    layout.MonadWide(name="[W]",
                     border_focus="#ff8c00",
                     ratio=0.7,
                     margin=6),

"""

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {"wmclass": "confirm"},
    {"wmclass": "dialog"},
    {"wmclass": "download"},
    {"wmclass": "error"},
    {"wmclass": "file_progress"},
    {"wmclass": "notification"},
    {"wmclass": "splash"},
    {"wmclass": "toolbar"},
    {"wmclass": "confirmreset"},  # gitk
    {"wmclass": "makebranch"},  # gitk
    {"wmclass": "maketag"},  # gitk
    {"wname": "branchdialog"},  # gitk
    {"wname": "pinentry"},  # GPG key password entry
    {"wmclass": "ssh-askpass"},  # ssh-askpass
])
