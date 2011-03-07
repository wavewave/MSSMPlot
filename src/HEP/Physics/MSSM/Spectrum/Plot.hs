{-# LANGUAGE NamedFieldPuns, RecordWildCards #-}

module HEP.Physics.MSSM.Spectrum.Plot where

import Control.Monad

import HROOT
import HROOT.Type
import HROOT.Function
import HROOT.Class

import HEP.Physics.MSSM.Type
  

helloworld :: OutputPhys -> IO ()
helloworld OutputPhys {..} = do 
  putStrLn "hi"
  
  let ymin = 0 
      ymax = 1000
      
  c1 <- newTCanvas "test" "test" 640 480  
  
  setBorderMode c1 0 
  setFillStyle  c1 1001
  setFillColor  c1 10
  
  range1 <- newTH2F "test" "test" 100 0.0 130.0 100 ymin ymax 
  draw range1 "" 
  
  xaxis <- getXaxis range1 
  yaxis <- getYaxis range1
  
  setTickLength xaxis 0 
  setLabelSize xaxis 0 
  setTitle yaxis "Mass ( GeV )" 
  setTitleOffset yaxis 1.25
  setNdivisions yaxis 505 1
  

  l_h   <- newTLine  10.0 mass_Mh 20.0 mass_Mh 
  la_h  <- newTLatex 14.0 (mass_Mh+45) "h" 
  
  l_A   <- newTLine  10.0 mass_MH3 20.0 mass_MH3
  la_A  <- newTLatex 10.0 (mass_MH3+45) "A"  
  
  l_H   <- newTLine  10.0 mass_MHH 20.0 mass_MHH
  la_H  <- newTLatex 14.0 (mass_MHH+45) "H"
  
  l_Hp  <- newTLine  10.0 mass_MHc 20.0 mass_MHc
  la_Hp <- newTLatex 18.0 (mass_MHc+45) "H^{#pm}"

  ls_neut  <- forM [mass_MNE1,mass_MNE2,mass_MNE3,mass_MNE4] $ 
                \x -> newTLine 30.0 x 40.0 x 
  la_neut1 <- newTLatex 30.0 (mass_MNE1+45) "#chi_{i}^{0}"
  
  ls_ch    <- forM [mass_MC1,mass_MC2] $
                \x -> newTLine 50.0 x 60.0 x 

  l_gluino <- newTLine 70.0 mass_MSG 80.0 mass_MSG
  
  [l_u11,l_d11,l_e11,l_snu1] <- 
    forM [mass_MSuL, mass_MSdL, mass_MSeL, mass_MSne ] $ 
      \x -> newTLine 90.0 x 94.0 x 

  [l_u12,l_d12,l_e12] <- 
    forM [mass_MSuR, mass_MSdR, mass_MSeR ] $ 
      \x -> newTLine 96.0 x 100.0 x 

  [l_u31,l_d31,l_e31,l_snu3] <- 
    forM [mass_MSt1, mass_MSb1, mass_MSl1, mass_MSn1 ] $ 
      \x -> newTLine 110.0 x 114.0 x 

  [l_u32,l_d32,l_e32] <- 
    forM [mass_MSt2, mass_MSb2, mass_MSl2 ] $ 
      \x -> newTLine 116.0 x 120.0 x 


  mapM_ (flip draw "")  ( [ l_h, l_A, l_H, l_Hp ] 
                          ++ ls_neut ++ ls_ch ++ [l_gluino]
                          ++ [l_u11,l_d11,l_e11,l_snu1] 
                          ++ [l_u12,l_d12,l_e12] 
                          ++ [l_u31,l_d31,l_e31,l_snu3] 
                          ++ [l_u32,l_d32,l_e32] )
    
                       
  mapM_ (flip draw "")  [la_h, la_A, la_H, la_Hp ] 


  saveAs c1 "test.pdf" ""  
  
