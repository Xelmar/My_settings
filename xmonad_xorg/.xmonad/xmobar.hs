Config { 
    font = "xft:Liberation Sans:size=9:bold italic::antialias=true"
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = Static { xpos = 0, ypos = 0, width = 1370, height = 16 },
    lowerOnStart = True,
    commands = [
        Run Memory ["-t","<used>/<total>M (<cache>M)","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10      
        --Run Weather "UUDD" ["-t","<station>: <tempC>C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
	--, Run Weather "UUDD" ["-t","<tempC>°C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
        ,Run Network "wlp1s0" [
             "-t"    ,"rx:<rx>, tx:<tx>"
            ,"-H"   ,"200"
            ,"-L"   ,"10"
            ,"-h"   ,"#FFB6B0"
            ,"-l"   ,"#CEFFAC"
            ,"-n"   ,"#FFFFCC"
            , "-c"  , " "
            , "-w"  , "2"
            ] 10
        ,Run Battery ["-t","[<left>]"] 600
        ,Run Date "%Y.%m.%d %H:%M:%S" "date" 10
        ,Run MultiCpu [ "--template" , "<autototal>"
            , "--Low"      , "50"         -- units: %
            , "--High"     , "85"         -- units: %
            , "--low"      , "gray"
            , "--normal"   , "darkorange"
            , "--high"     , "darkred"
            , "-c"         , " "
            , "-w"         , "3"
        ] 10
        ,Run PipeReader "/tmp/.volume-pipe" "vol" 
        ,Run CoreTemp [ "--template" , "<core0> <core1>°C"
            , "--Low"      , "60"        -- units: °C
            , "--High"     , "70"        -- units: °C
            , "--low"      , "darkgreen"
            , "--normal"   , "darkorange"
            , "--high"     , "darkred"
        ] 50
        ,Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ <fc=#FFFF00> %vol% </fc>  | %multicpu% | %memory%  | %wlp1s0% |  %battery%  | <fc=#FFFFCC>%date%</fc>   "
}

-- <icon=/home/tolkv/.sysgit/dzen/bitmaps/music.xbm/>
