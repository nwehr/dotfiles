Config {
       font = "xft:FiraMono Nerd Font Mono:size=13:bold:antialias=true"
       , additionalFonts = [ "xft:FiraMono Nerd Font Mono:size=12" ]
       , allDesktops = True
       , bgColor = "#0f111b"
       , fgColor = "#ecf0c1"
       , position = TopW L 100
       , commands = [ Run Cpu [ "--template", "<fc=#e33400><fn=1></fn></fc> <total>%"
                              , "--Low","3"
                              , "--High","50"
                              , "--low","#bbc2cf"
                              , "--normal","#bbc2cf"
                              , "--high","#fb4934"] 50

                    , Run Memory ["-t","<fc=#00a3cc><fn=1></fn></fc> <usedratio>%"
                                 ,"-H","80"
                                 ,"-L","10"
                                 ,"-l","#bbc2cf"
                                 ,"-n","#bbc2cf"
                                 ,"-h","#fb4934"] 50

                    , Run Date "<fc=#f2ce00><fn=1></fn></fc> %a %b %_d %I:%M" "date" 300
                    , Run DynNetwork ["-t","<fc=#5ccc96><fn=1></fn></fc> <rx>, <fc=#7a5ccc><fn=1></fn></fc> <tx>"
                                     ,"-H","200"
                                     ,"-L","10"
                                     ,"-h","#bbc2cf"
                                     ,"-l","#bbc2cf"
                                     ,"-n","#bbc2cf"] 50

                    , Run CoreTemp ["-t", "<fc=#CDB464><fn=1></fn></fc> <core0>°"
                                   , "-L", "30"
                                   , "-H", "75"
                                   , "-l", "lightblue"
                                   , "-n", "#bbc2cf"
                                   , "-h", "#aa4450"] 50

                    -- battery monitor
                    , Run BatteryP       [ "BAT0" ]
                                         [ "--template" , "<fc=#B1DE76><fn=1></fn></fc> <acstatus>"
                                         , "--Low"      , "10"        -- units: %
                                         , "--High"     , "80"        -- units: %
                                         , "--low"      , "#fb4934" -- #ff5555
                                         , "--normal"   , "#bbc2cf"
                                         , "--high"     , "#98be65"

                                         , "--" -- battery specific options
                                                   -- discharging status
                                                   , "-o"   , "<left>% (<timeleft>)"
                                                   -- AC "on" status
                                                   , "-O"   , "<left>% (<fc=#98be65>Charging</fc>)" -- 50fa7b
                                                   -- charged status
                                                   , "-i"   , "<fc=#98be65>Charged</fc>"
                                         ] 50
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %StdinReader% }{ %cpu% | %memory% | %dynnetwork% | %date% "   -- #69DFFA
       }
