Config { 
    font = "xft:Liberation Sans:size=14:bold italic"--"xft:Liberation Sans:size=12:bold italic::antialias=true",
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
    iconRoot = "/home/xelmar/.xmonad/.icons/",
    commands = 
    	[ Run DiskIO [("/", "<fc=orange> SSD: </fc><icon=io.xpm/> <read> <write>")] [] 3
	, Run MultiCpu [ "--template" , "[ <autototal> ]"
            , "--Low"      , "50"         -- units: %
            , "--High"     , "85"         -- units: %
            , "--low"      , "gray"
            , "--normal"   , "darkorange"
            , "--high"     , "red" --darkred
	    , "--suffix"   , "true"
            , "-c"         , " "
	    , "-w"         , "3"
            ] 10
	, Run CoreTemp 
	   [ "-t", "<fc=orange>Core: </fc><icon=temp.xpm/> <core0> <core1> <core2> <core3> °C"
	   , "-L", "70", "-H", "90"
	   , "-l", "gray90", "-n", "#FFD700", "-h", "red"
	   ] 3
	, Run Com "zsh" ["/home/xelmar/.xmonad/.sh/ssd_temp.sh"] "ssd_t" 100
	, Run Com "zsh" ["/home/xelmar/.xmonad/.sh/gpu_temp.sh"] "gpu_t" 100
	, Run Com "zsh" ["/home/xelmar/.xmonad/.sh/gpu_util.sh"] "gpu_u" 10
	, Run Com "zsh" ["/home/xelmar/.xmonad/.sh/gpu_mem.sh"] "gpu_m" 50
	],
    position = Static { xpos = 12, ypos = 1053, width = 1896, height = 22 },
    lowerOnStart = True,
    sepChar = "%",
    alignSep = "}{",
    template = " %diskio% <icon=temp.xpm/> %ssd_t%°C | %coretemp% } %multicpu% { <fc=orange>GPU:</fc> <icon=temp.xpm/> %gpu_t%  <icon=util.xpm/> %gpu_u%  <icon=memory.xpm/> %gpu_m% "
}
