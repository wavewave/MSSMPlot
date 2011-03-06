module HEP.Physics.MSSM.Spectrum.Plot where

import HROOT
import HROOT.Type
import HROOT.Function
import HROOT.Class


helloworld :: IO ()
helloworld = do 
  putStrLn "hi"
  c1 <- newTCanvas "test" "test" 640 480  
  saveAs c1 "test.pdf" ""  
  
