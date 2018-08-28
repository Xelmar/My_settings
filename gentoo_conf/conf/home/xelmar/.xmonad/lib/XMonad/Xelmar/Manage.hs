module XMonad.Xelmar.Manage(myWorkspaces,myManageHook) where

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.InsertPosition

myWorkspaces :: [String]
myWorkspaces = map show [1..9] --["1:WorkGround","2:dev","3:web","4:apps","5:media"] ++ map show [6..9]

myManageHook :: ManageHook
myManageHook = composeAll 
	[ workspaceManageHook
	, manageDocks
	, composeOne . concat $
		[ [isDialog -?> doCenterFloat]
		, [stringProperty "WM_WINDOW_ROLE" =? "pop-up" -?> doCenterFloat]
		, [className =? c -?> doCenterFloat | c <- floatClass]
		, [transience]
		, [pure True -?> insertPosition Below Newer]
		]
	, manageHook def
	]

workspaceManageHook = composeAll [ className =? c --> doShift ws | (ws, cs) <- wsClass, c <- cs ]
floatClass = [ "feh" , "Steam" , "xterm", "application.Main" ]
wsClass = zip myWorkspaces
	[ []
	, ["Rstudio","QtCreator"]
	, ["Chromium-browser-chromium"]
	, ["VirtualBox","Thunar"]
	, ["Steam","TelegramDesktop","Slack"]
	]


