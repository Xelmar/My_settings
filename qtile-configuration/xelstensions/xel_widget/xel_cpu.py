from libqtile.widget import base
import psutil


class XelCPU(base.ThreadedPollText):
    """
    Modified copy of libqtile.widget.CPU
    """
    orientations = base.ORIENTATION_HORIZONTAL

    defaults = [
        ("update_interval", 1.0, "Update interval for the CPU widget"),
    ]

    def __init__(self, **config):
        super().__init__(**config)
        self.add_defaults(type(self).defaults)

    def tick(self):
        self.update(self.poll())
        return self.update_interval

    def poll(self):
        freqs = psutil.cpu_percent(percpu=True)
        message = " ".join(f"{freq}%" for freq in freqs)

        return f"[{message}]"
