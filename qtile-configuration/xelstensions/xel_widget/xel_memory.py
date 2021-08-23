from libqtile.widget import Memory
#import psutil

XelMemory = Memory

"""
class XelMemory(Memory):
    def __init__(self, **config):
        super().__init__(**config)
        self.add_defaults(type(self).defaults)

    def poll(self):
        mem = psutil.virtual_memory()
        swap = psutil.swap_memory()
        val = {}
        val["MemUsed"] = mem.used // 1024 // 1024
        val["MemTotal"] = mem.total // 1024 // 1024
        val["MemFree"] = mem.free // 1024 // 1024
        val["MemPercent"] = mem.percent
        val["Buffers"] = mem.buffers // 1024 // 1024
        val["Active"] = mem.active // 1024 // 1024
        val["Inactive"] = mem.inactive // 1024 // 1024
        val["Shmem"] = mem.shared // 1024 // 1024
        val["SwapTotal"] = swap.total // 1024 // 1024
        val["Swapfree"] = swap.free // 1024 // 1024
        val["SwapUsed"] = swap.used // 1024 // 1024
        return self.format.format(**val)
"""
