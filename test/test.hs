module Main where

import HEP.Physics.MSSM.OutputPhys
import HEP.Physics.MSSM.Spectrum.Plot

testphys = OutputPhys {
  mass_Mh   = 100.0,
  mass_MHH  = 105.0, 
  mass_MH3  = 300,
  mass_MHc  = 340, 
  mass_MNE1 = 120, 
  mass_MNE2 = 240,
  mass_MNE3 = 308, 
  mass_MNE4 = 500, 
  mass_MC1  = 500, 
  mass_MC2  = 250, 
  mass_MSG  = 700, 
  mass_MSuL = 350, 
  mass_MSdL = 690, 
  mass_MSeL = 400, 
  mass_MSne = 340, 
  mass_MSuR = 320, 
  mass_MSdR = 820, 
  mass_MSeR = 400, 
  mass_MScL = 440,
  mass_MSsL = 460, 
  mass_MSmL = 120, 
  mass_MSnm = 130, 
  mass_MScR = 140, 
  mass_MSsR = 150, 
  mass_MSmR = 160,
  mass_MSt1 = 490, 
  mass_MSb1 = 393, 
  mass_MSl1 = 728, 
  mass_MSn1 = 138, 
  mass_MSt2 = 240, 
  mass_MSb2 = 250,
  mass_MSl2 = 440, 
  deltarho  = 0.1, 
  gmuon     = 0.9, 
  bsgnlo    = 7.5, 
  bsmumu    = 3.3, 
  bino      = 0.1, 
  wino      = 0.5, 
  higgsino1 = 0.9, 
  higgsino2 = 0.8, 
  micro_Xf  = 30, 
  micro_Omega = 0.03 
} 

main = do 
  spectrumplot "test.pdf"  testphys 0 2000