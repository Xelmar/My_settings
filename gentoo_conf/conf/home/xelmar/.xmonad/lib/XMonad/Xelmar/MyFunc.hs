module XMonad.Xelmar.MyFunc(gaps_flag,def_gaps,change_gaps) where

import XMonad.Layout.Gaps

gaps_flag = 0
def_gaps = [(U,28),(D,28),(R,6),(L,6)]

-- change_gaps :: Int -> Int
change_gaps gaps_flag 
      | gaps_flag == 0 = reduce_gaps
      | gaps_flag == 1 = set_def_gaps

reduce_gaps = do
      let gaps_flag = 1
      setGaps [(U,0),(D,0),(R,0),(L,0)]

set_def_gaps = do
      let gaps_flag = 0
      setGaps def_gaps
