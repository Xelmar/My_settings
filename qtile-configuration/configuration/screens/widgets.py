from libqtile import widget
#import psutil

from xelstensions import xel_widget

widgets_top = [
    widget.GroupBox(block_highlight_text_color="#ffffff",
                    hide_unused=True,
                    highlight_color=["#1d1d1d", "#1d1d1d"],
                    highlight_method="line",
                    rounded=False,
                    this_current_screen_border="#ff6600",
                    urgent_alert_method="line",
                    urgent_border="#483d8b"),
    widget.WindowName(),
    xel_widget.XelMemory(format="[{MemPercent}%]"),
    widget.Net(format="[{down} ↓↑ {up}]"),
    widget.Systray(),
    widget.Clock(format="[%d-%m-%Y %H:%M]"),
    widget.QuickExit()
]

widgets_bot = [
    widget.TextBox("SSD: "),
    widget.HDDBusyGraph(device="nvme0n1"),
    widget.Spacer(),
    xel_widget.XelCPU()
]

#widgets_bot.append(widget.TextBox("CPU: "))
#for index in range(psutil.cpu_count()):
#    widgets_bot.append(widget.CPUGraph(core=index))


