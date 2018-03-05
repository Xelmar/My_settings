Config { 
    font = "xft:Liberation Sans:size=12:bold italic::antialias=true",
    additionalFonts = ["xft:Liberation Sans:size=12:bold italic::antialias=true"],
    bgColor = "#000000",
    fgColor = "#ffffff",
    --border = FullBM 0,
    alpha = 205,
    border = NoBorder,
    borderColor = "gray15",
    textOffset = 14,
    iconOffset = -1,
    allDesktops = False,
    overrideRedirect = True,
    pickBroadest = False,
    hideOnStart = False,
    persistent = False,
    iconRoot = ".",
    commands = [
    	Run UnsafeStdinReader
	]},
    position = Static { xpos = 12, ypos = 1056, width = 1896, height = 18 },
    lowerOnStart = True,
    sepChar = "%",
    alignSep = "}{",
    template = " }{ %UnsafeStdinReader% "
}

