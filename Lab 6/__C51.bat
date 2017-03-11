@echo off
::This file was created automatically by CrossIDE to compile with C51.
F:
cd "\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\"
"D:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c"
if not exist hex2mif.exe goto done
if exist LEDmatrix.ihx hex2mif LEDmatrix.ihx
if exist LEDmatrix.hex hex2mif LEDmatrix.hex
:done
echo done
echo Crosside_Action Set_Hex_File F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.hex
