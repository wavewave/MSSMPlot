{-# LANGUAGE NamedFieldPuns, RecordWildCards #-}

module HEP.Physics.MSSM.Spectrum.Plot where

import Control.Monad

import HROOT

import HEP.Physics.MSSM.OutputPhys
  

spectrumplot :: FilePath -> OutputPhys -> Double -> Double -> IO ()
spectrumplot fp (OutputPhys {..}) ymin ymax = do 
  putStrLn "drawing the spectrum"
      
  c1 <- newTCanvas "test" "test" 640 480  
  
  frame <- getFrame c1 

  setBorderMode frame 0 
  setFillStyle  c1 1001
  setFillColor  c1 10
  
  range1 <- newTH2F "test" "test" 100 0.0 130.0 100 ymin ymax 
  draw range1 "" 
  
  xaxis <- tH1GetXaxis (upcastTH1 range1)
  yaxis <- tH1GetYaxis (upcastTH1 range1)
  
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

  forM_ [la_h,la_A,la_H,la_Hp] (textstyle 1) 

  ls_neut  <- forM [mass_MNE1,mass_MNE2,mass_MNE3,mass_MNE4] $ 
                \x -> newTLine 30.0 x 40.0 x 
  la_neut1 <- newTLatex 30.0 (mass_MNE1+45) "#chi_{i}^{0}"
  textstyle 9 la_neut1  

  ls_ch    <- forM [mass_MC1,mass_MC2] $
                \x -> newTLine 50.0 x 60.0 x 

  la_ch1   <- newTLatex 50.0 (mass_MC1+45) "#chi_{i}^{#pm}"
  textstyle 4 la_ch1


  l_gluino <- newTLine 70.0 mass_MSG 80.0 mass_MSG
  la_gluino<- newTLatex 74 (mass_MSG+45) "#tilde{g}"  
  textstyle 2 la_gluino

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


  forM_ [l_h,l_A,l_H,l_Hp] $ \x -> setLineColor x 1
  forM_ ls_neut $ \x -> setLineColor x 9 
  forM_ ls_ch $ \x -> setLineColor x 4 

  setLineColor l_gluino 2

  forM_ [l_u11,l_u12,l_u31,l_u32] $ \x->setLineColor x 46

  forM_ [l_d11,l_d12,l_d31,l_d32] $ \x->setLineColor x 35

  forM_ [l_e11,l_e12,l_snu1,l_e31,l_e32,l_snu3] $ \x -> setLineColor x 30

  la_u11 <- newTLatex 87 (mass_MSuL+45) "#tilde{u}_{i}"
  la_u12 <- newTLatex 90 (mass_MSuR+45) "1st, 2nd gen"
  la_d11 <- newTLatex 96 (mass_MSdL+45) "#tilde{d}_{i}"
  la_e11 <- newTLatex 96 (mass_MSeL+45) "#tilde{e}_{i}"
  la_snu1 <- newTLatex 90 (mass_MSne+45) "#tilde{#nu}_{i}"

  la_u31 <- newTLatex 107 (mass_MSt1+45) "#tilde{u}_{i}"
  la_u32 <- newTLatex 110 (mass_MSt2+45) "3rd gen"
  la_d31 <- newTLatex 116 (mass_MSb1+45) "#tilde{d}_{i}"
  la_e31 <- newTLatex 116 (mass_MSl1+45) "#tilde{e}_{i}"
  la_snu3 <- newTLatex 116 (mass_MSn1+45) "#tilde{#nu}_{i}"

  forM_ [la_u11,la_u12,la_u31,la_u32] (textstyle 46) 
  forM_ [la_d11,la_d31] (textstyle 35)
  forM_ [la_e11,la_e31] (textstyle 30)



  mapM_ (flip draw "")  ( [ l_h, l_A, l_H, l_Hp ] 
                          ++ ls_neut ++ ls_ch ++ [l_gluino]
                          ++ [l_u11,l_d11,l_e11,l_snu1] 
                          ++ [l_u12,l_d12,l_e12] 
                          ++ [l_u31,l_d31,l_e31,l_snu3] 
                          ++ [l_u32,l_d32,l_e32] )
    
                       
  mapM_ (flip draw "")  [ la_h, la_A, la_H, la_Hp 
                        , la_neut1, la_ch1, la_gluino
                        , la_u11, la_u12, la_d11, la_e11, la_snu1
                        , la_u31, la_u32, la_d31, la_e31, la_snu3
                        ] 


  saveAs c1 fp ""  
  
textstyle color x = do 
  setTextColor x color
  setTextAlign x 12
  setTextSize x 0.04
   