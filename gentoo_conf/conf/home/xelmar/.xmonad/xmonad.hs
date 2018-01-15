-- Core
import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.Exit
import Graphics.X11.Xlib
import Graphics.X11.ExtraTypes.XF86
--import IO (Handle, hPutStrLn)
import qualified System.IO
import XMonad.Actions.CycleWS (nextScreen,prevScreen)
import Data.List
 
-- Prompts
import XMonad.Prompt
import XMonad.Prompt.Shell
 
-- Actions
import XMonad.Actions.MouseGestures
import XMonad.Actions.UpdatePointer
import XMonad.Actions.GridSelect
 
-- Utils
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.Loggers
import XMonad.Util.EZConfig
import XMonad.Util.Scratchpad
-- Hooks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.Place
import XMonad.Hooks.EwmhDesktops

-- Layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.DragPane
import XMonad.Layout.LayoutCombinators hiding ((|||))
import XMonad.Layout.DecorationMadness
import XMonad.Layout.TabBarDecoration
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Layout.Spiral
import XMonad.Layout.Mosaic
import XMonad.Layout.LayoutHints

import Data.Ratio ((%))
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Gaps
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName

defaults = defaultConfig {
        --terminal      = "terminator"
	terminal             = "urxvt"
        --, font		  = "xft:Monospace:size=10"
        , normalBorderColor  = "black"
        , focusedBorderColor  = "orange"        
        , workspaces          = myWorkspaces
        , modMask             = mod1Mask
        , borderWidth         = 2
        , startupHook         = setWMName "LG3D"
        , layoutHook          = myLayoutHook
        , manageHook          = myManageHook
        , handleEventHook     = fullscreenEventHook
	}`additionalKeys` myKeys

myWorkspaces :: [String]
myWorkspaces =  ["1:WorkGround","2:dev","3:web","4:apps","5:media"] ++ map show [6..9]

-- tab theme default
myTabConfig = defaultTheme {
   activeColor          = "#6666cc"
  , activeBorderColor   = "#000000"
  , inactiveColor       = "#666666"
  , inactiveBorderColor = "#000000"
  , decoHeight          = 10
 }

-- Color of current window title in xmobar.
xmobarTitleColor = "#FFFFFF"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#8AE234"

myLayoutHook = spacing 6 $ gaps [(U,28),(D,28),(R,6),(L,6)] $ toggleLayouts (noBorders Full) $ 
    smartBorders $ Mirror tiled ||| mosaic 2 [3,2]  ||| tabbed shrinkText myTabConfig
      where 
        tiled = Tall nmaster delta ratio
        nmaster = 1
        delta   = 3/100
        ratio   = 3/5

                              
myManageHook :: ManageHook
	
myManageHook = composeAll . concat $
	[ [className =? c --> doF (W.shift "1:WorkGround")	| c <- myWorkG]
	, [className =? c --> doF (W.shift "2:dev")		| c <- myDev]
	, [className =? c --> doF (W.shift "3:web")		| c <- myWeb]
	, [className =? c --> doF (W.shift "4:apps")		| c <- myApps]
	, [className =? c --> doF (W.shift "5:media")		| c <- myMedia]
	, [manageDocks]
	]
	where
	myWorkG = ["python"]
	myDev = ["Rstudio","QtCreator"]
	myWeb = ["Chromium-browser-chromium"]
	myApps = ["VirtualBox","Thunar"]
	myMedia = ["Steam","TelegramDesktop"]
	
	--KP_Add KP_Subtract
myKeys = [
           ((mod1Mask, xK_Right), nextScreen) 
         , ((mod1Mask .|. controlMask, xK_Left ), prevScreen)
         , ((mod1Mask, xK_o), goToSelected defaultGSConfig)
	 --, ((mod1Mask, xK_a), spawnSelected defaultGSConfig ["chromium","idea","gvim"])
	 --, ((mod4Mask, 0), spawnSelected defaultGSConfig ["1","2","3"])
	 , ((mod1Mask, xF86XK_AudioRaiseVolume), spawn "amixer sset Master 5%+ && ~/.xmonad/sh/getvolume.sh > /tmp/.volume-pipe")
	 , ((mod1Mask, xF86XK_AudioLowerVolume), spawn "amixer sset Master 5%- && ~/.xmonad/sh/getvolume.sh > /tmp/.volume-pipe")
         , ((mod1Mask, xF86XK_AudioMute), spawn "amixer sset Master toggle & amixer -c 1 sset Headphone toggle & amixer -c 1 sset Speaker toggle") 
         , ((mod1Mask, xF86XK_MonBrightnessDown), spawn "sudo ~/.xmonad/sh/change_brightness.sh -10")
         , ((mod1Mask, xF86XK_MonBrightnessUp), spawn "sudo ~/.xmonad/sh/change_brightness.sh +10")
	 , ((mod1Mask, xK_r), spawn "chromium --app='http://127.0.0.1:8787'")
	 , ((mod1Mask, xK_s), spawn "steam")
	 , ((mod1Mask, xK_p), spawn "dmenu_run -x 12 -y 8 -w 1896")
	 , ((mod1Mask, xK_e), spawn "telegram-desktop")
         , ((mod1Mask, xK_f), spawn "thunar")
         , ((mod1Mask, xK_w), spawn "chromium")
         , ((mod1Mask, xK_m), spawn "urxvt -e mocp")
	 , ((mod1Mask, xK_q), spawn "qtcreator")
	 , ((mod1Mask, xK_v), spawn "VirtualBox")
	 , ((mod1Mask .|. shiftMask, xK_l), spawn "~/.xmonad/sh/lock_screen.sh")
         , ((mod1Mask .|. shiftMask, xK_t), spawn "urxvt")
	 , ((mod1Mask .|. shiftMask, xK_s), spawn "xfce4-screenshooter")
	 --, (mod4Mask, button2)
         ]
                   


main = do
	xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
	spawnPipe "~/.xmonad/perl/parse.pl | dzen2 -ta r -tw 1896 -x 12 -y 1056 -h 16"
	xmonad $ defaults {
	logHook =  dynamicLogWithPP $ defaultPP {
            ppOutput = System.IO.hPutStrLn xmproc
          , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100 .wrap "  [ <fc=orange> " " </fc> ]  "
          , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor "" . wrap "[" "]"
          , ppSep = "   "
          , ppWsSep = " "
          --, ppLayout = const ""
          , ppLayout  = (\ x -> case x of
              "Spacing 6 Mosaic"                      -> "[:]"
              "Spacing 6 Mirror Tall"                 -> "[M]"
              "Spacing 6 Tabbed Simplest"             -> "[T]" --Hinted Tabbed
              "Spacing 6 Full"                        -> "[ ]"
              _                                       -> x )
          , ppHiddenNoWindows = showNamedWorkspaces
      } 
} where showNamedWorkspaces wsId = if any (`elem` wsId) ['a'..'z']
                                       then pad wsId
                                       else ""
