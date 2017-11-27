Config { 
    font = "xft:Liberation Sans:size=12:bold italic::antialias=true"
    bgColor = "#000000",
    fgColor = "#ffffff",
    --border = FullBM 0,
    alpha = 205,
    position = Static { xpos = 12, ypos = 8, width = 1896, height = 16 },
    lowerOnStart = True,
    commands = [
        Run Memory ["-t","<used>/<total>M (<cache>M)","-H","8192","-L","4096","-h","orange","-l","#CEFFAC","-n","#FFFFCC"] 10  --FFB6B0    
        --Run Weather "UUDD" ["-t","<station>: <tempC>C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
	--, Run Weather "UUDD" ["-t","<tempC>°C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
        ,Run Network "wlp2s0" [
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
            , "--high"     , "red" --darkred
            , "-c"         , " "
            , "-w"         , "3"
        ] 10
        ,Run PipeReader "/tmp/.volume-pipe" "vol" 
        ,Run CoreTemp [ "<core0>°C <core1>°C <core2>°C <core3>°C <core4>°C <core5>°C <core6>°C <core7>°C"
            , "--Low"      , "60"        -- units: °C
            , "--High"     , "70"        -- units: °C
            , "--low"      , "darkgreen"
            , "--normal"   , "darkorange"
            , "--high"     , "darkred"
        ] 10
        ,Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ <fc=#FFFF00> %vol% </fc> | %multicpu%  | %memory% | %wlp2s0% |  %battery%  | <fc=#FFFFCC>%date%</fc>   "
}

