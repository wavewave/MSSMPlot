{-# LANGUAGE NamedFieldPuns, RecordWildCards #-}

module HEP.Physics.MSSM.Spectrum.Latex where

import HEP.Physics.MSSM.Type 

endl = "\n"

outputLaTeXForMSSM :: OutputPhys -> String 
outputLaTeXForMSSM OutputPhys {..} = 
  let latexfile = "\\begin{table}" ++ endl 
	      ++ "\\begin{tabular}{cc|cc}" ++ endl
	      ++ "\\hline" ++ endl
	      ++ "\\hline" ++ endl 
	      ++ "Particle & Mass(GeV) & Particle & Mass(GeV) \\\\" ++ endl
	      ++ "$h$ & " ++ mass_Mh ++ " & $H$ &" ++ mass_mHH ++ "\\\\" ++ endl
	      ++ "$A$ & " ++ mass_MH3 ++ " & $H^\\pm$ & " ++ mass_MHc ++ "\\\\" ++ endl
	      ++ "$\\chi^0_1$ " ++ mass_MNE1 
	      ++ " & $\\chi^0_2$ & " ++ mass_MNE2 ++ "\\\\" ++ endl
	      ++ "$\\chi^0_3$ " ++ mass_MNE3
	      ++ " & $\\chi^0_4$ & " ++ mass_MNE4 ++ "\\\\" ++ endl
	      ++ "$\\chi^\\pm_1$ & " ++ mass_MC1 
	      ++ " & $\\chi^\\pm_2$ & " ++ mass_MC2 ++ "\\\\" ++ endl
	      ++ "$\\tilde{g}$ & " ++ mass_MSG ++ " & & \\\\ " ++endl
      	      ++ "$\\tilde{u}_L$ & " ++ mass_MSuL 
	      ++ " & $\\tilde{u}_R$ & " ++ mass_MSuR ++ " \\\\" ++ endl
	      ++ "$\\tilde{d}_L$ & " ++ mass_MSdL 
	      ++ " & $\\tilde{d}_R$ & " ++ mass_MSdR ++ " \\\\" ++ endl
	      ++ "$\\tilde{e}_L$ & " ++ mass_MSeL 
	      ++ " & $\\tilde{e}_R$ & " ++ mass_MSeR ++ " \\\\" ++ endl
	      ++ "$\\tilde{t}_1$ & " ++ mass_MSt1 
	      ++ " & $\\tilde{t}_2$ & " ++ mass_MSt2 ++ " \\\\" ++ endl
      	      ++ "$\\tilde{b}_1$ & " ++ mass_MSb1
      	      ++ " & $\\tilde{b}_2$ & " ++ mass_MSb2 ++ " \\\\" ++ endl
    	      ++ "$\\tilde{\\tau}_1$ & " ++ mass_MSl1 
	      ++ " & $\\tilde{\\tau}_2$ & " ++ mass_MSl2 ++ " \\\\" ++ endl
	      ++ " \\hline " ++ endl
	      ++ " \\hline " ++ endl
      	      ++ "\\end{tabular}" ++ endl
	      ++ "\\end{table}" ++ endl ;  
