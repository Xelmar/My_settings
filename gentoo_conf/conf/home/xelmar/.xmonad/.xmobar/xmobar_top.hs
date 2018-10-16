Config { 
    font = "xft:Liberation Sans:size=14:bold italic::antialias=true,unifont:size=14:bold::antialias=true",
    bgColor = "#000000",
    fgColor = "#ffffff",
    --border = FullBM 0,
    alpha = 205,
    position = Static { xpos = 12, ypos = 6, width = 1896, height = 20 },
    lowerOnStart = True,
    iconRoot = "/home/xelmar/.xmonad/.icons/",
    commands = [
        Run Memory ["-t","<icon=memory.xpm/> <usedratio>%","-H","8192","-L","4096","-h","orange","-l","#CEFFAC","-n","#FFFFCC"] 10  --FFB6B0    
        --Run Weather "UUDD" ["-t","<station>: <tempC>C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
	--, Run Weather "UUDD" ["-t","<tempC>°C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
        ,Run Network "wlp2s0" [
             "-t"    ,"rx:<rx>, tx:<tx>"
            ,"-n"   ,"#FFFFCC"
            ] 10 
    	,Run DynNetwork 
	    [ "--template", "<icon=wireless.xpm/> <rx>KB <tx>KB"
   	    , "--width", "4"
            ,"-H"   ,"200"
            ,"-L"   ,"10"
            ,"-h"   ,"#FFB6B0"
            ,"-l"   ,"#CEFFAC"
            , "-c"  , " "
            , "-w"  , "2"
	    --, "-S", "True"
	    ] 10
	,Run Volume "default" "Master" 
	    [ "-t", "<icon=audio.xpm/> <volume> <status>"
	    , "--"
	    , "--on", ""
	    , "--off", "Mute"
	    , "--offc", "#FF0000"
	    ] 10
	,Run Battery 
	    ["-t", "[<left>]<acstatus>"
	    , "--", "-O", " <icon=charging_bat.xpm/>"
	    , "-i", " <icon=charged_bat.xpm/>"
	    , "-o", ""
	    ] 600
        ,Run Date " %Y.%m.%d %H:%M:%S" "date" 10
        
        ,Run CoreTemp [ "<core0>°C <core1>°C <core2>°C <core3>°C <core4>°C <core5>°C <core6>°C <core7>°C"
            , "--Low"      , "60"        -- units: °C
            , "--High"     , "70"        -- units: °C
            , "--low"      , "darkgreen"
            , "--normal"   , "darkorange"
            , "--high"     , "darkred"
        ] 10
	,Run StdinReader
    ],
    --sepChar = "%",
    alignSep = "}{",
    template = " %StdinReader% } <icon=vl.xpm/><icon=ds.xpm/><icon=vr.xpm/> <fn=0></fn>{%default:Master% | %memory% | %dynnetwork% | %battery% | <fc=#FFFFCC>%date%</fc>   "
}

