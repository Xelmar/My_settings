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
import Data.Char

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
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.InsertPosition
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

import XMonad.Xelmar.Manage

defaults = defaultConfig {
	terminal              = "urxvt"
        --, font		      = "xft:Hack:size=12:bold italici"--"xft:Monospace:size=10"
        , normalBorderColor   = "black"
        , focusedBorderColor  = "orange"        
        , workspaces          = myWorkspaces
        , modMask             = myModMask
        , borderWidth         = 2
        , startupHook         = setWMName "LG3D"
        , layoutHook          = myLayoutHook
        , manageHook          = myManageHook
        , handleEventHook     = fullscreenEventHook
	}`additionalKeys` myKeys

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



	

	--KP_Add KP_Subtract
myKeys = [
           ((myModMask, xK_Right), nextScreen) 
         , ((myModMask .|. controlMask, xK_Left ), prevScreen)
         , ((myModMask, xK_o), goToSelected defaultGSConfig)
	 , ((myModMask, xF86XK_AudioRaiseVolume), spawn "amixer sset Master 5%+")
	 , ((myModMask, xF86XK_AudioLowerVolume), spawn "amixer sset Master 5%-")
         , ((myModMask, xF86XK_AudioMute), spawn "amixer sset Master toggle & amixer -c 1 sset Headphone toggle & amixer -c 1 sset Speaker toggle") 
         , ((myModMask, xF86XK_MonBrightnessDown), spawn "sudo ~/.xmonad/.sh/change_brightness.sh -10")
         , ((myModMask, xF86XK_MonBrightnessUp), spawn "sudo ~/.xmonad/.sh/change_brightness.sh +10")
	 , ((myModMask, xK_r), spawn "chromium --app='http://127.0.0.1:8787'")
	 , ((myModMask, xK_s), spawn "steam")
	 , ((myModMask, xK_p), spawn "pinta")
	 , ((myModMask, xK_e), spawn "telegram-desktop")
         , ((myModMask, xK_f), spawn "thunar")
         , ((myModMask, xK_w), spawn "chromium")
         , ((myModMask, xK_m), spawn "urxvt -e mocp")
	 , ((myModMask, xK_v), spawn "VirtualBox")
	 , ((myModMask .|. shiftMask, xK_l), spawn "~/.xmonad/.sh/lock_screen.sh")
         , ((myModMask .|. shiftMask, xK_t), spawn "urxvt")
	 , ((myModMask .|. shiftMask, xK_s), spawn "gnome-screenshot -i")
         ]
                   

myModMask = mod1Mask

myCurrentWorkspace = [
	"ᛏ", -- tīwaz/teiwaz
	"ᛝ", -- ing/ingwaz
	"ᚱ", -- raidō
	"ᛟ", -- ōþila/ōþala
	"ᚹ", -- wunjō
	"ᛊ", -- sōwilō
	"ᛞ", -- dagaz
	"ᛗ", -- mannaz
	"ᛃ"  -- jēra
	]

myPPCurrent wid =
    xmobarColor "#FFA500" "" $ -- #FFD700
    (myCurrentWorkspace!!((digitToInt (wid!!0))-1)) where padLength = (maximum $ map length myWorkspaces) - length wid
myPPHidden wid =
    xmobarColor "#F5F5DC" "" $
    --mouseAction (mySwitchWorkspace wid) "1" $
    [head wid]
myPPHiddenNoWindows wid =
    xmobarColor "#767676" "" $
    --mouseAction (mySwitchWorkspace wid) "1" $
    [head wid]
myPPUrgent wid =
    xmobarColor "#D75F5F" "" $
    --mouseAction (mySwitchWorkspace wid) "1" $
    [head wid]

myPPTitleSanitize title = wrap (wrap "<raw=" ":" $ show (length shortTitle)) "/>" $ shortTitle
    where shortTitle = shorten 40 title

main = do
	xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/.xmobar/xmobar_top.hs"
	spawnPipe "xmobar ~/.xmonad/.xmobar/xmobar_bot.hs"
	xmonad $ defaults {
		logHook = dynamicLogWithPP $ defaultPP {
            		ppOutput = System.IO.hPutStrLn xmproc
          		, ppTitle = xmobarColor xmobarTitleColor "" . shorten 500 . wrap " [ <fc=orange> " " </fc> ] "
          		, ppTitleSanitize = myPPTitleSanitize
			--, ppCurrent = xmobarColor xmobarCurrentWorkspaceColor "" . wrap " [" "] "
	        	, ppCurrent = myPPCurrent
       			, ppHidden = myPPHidden
      			, ppHiddenNoWindows = myPPHiddenNoWindows
    			, ppUrgent = myPPUrgent
			, ppSep = "   "
        	 	, ppWsSep = " "
        	 	--, ppLayout = const ""
        	 	, ppLayout  = (\ x -> case x of
			      "Spacing 6 Mosaic"                      -> "[:]"
		              "Spacing 6 Mirror Tall"                 -> "[M]"
		              "Spacing 6 Tabbed Simplest"             -> "[T]" --Hinted Tabbed
		              "Spacing 6 Full"                        -> "[ ]"
		              _                                       -> x )
        	  	--, ppHiddenNoWindows = showNamedWorkspaces
      			}	
		}
		where showNamedWorkspaces wsId = if any (`elem` wsId) ['a'..'z']
                                       then pad wsId
                                       else ""
