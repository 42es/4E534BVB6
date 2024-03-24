@echo off
copy DX8VB.DLL %windir%\system32\
copy MSVBVM60.DLL %windir%\system32\
copy MSCOMCTL.OCX %windir%\system32\
copy COMDLG32.OCX %windir%\system32\
copy TABCTL32.OCX %windir%\system32\
regsvr32 DX8VB.DLL
regsvr32 MSVBVM60.DLL
regsvr32 MSCOMCTL.OCX
regsvr32 COMDLG32.OCX
regsvr32 TABCTL32.OCX