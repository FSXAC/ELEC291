@echo off
::This file was created automatically by CrossIDE to compile with C51.
F:
cd "\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\"
"D:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\f38x_autotest.c"
if not exist hex2mif.exe goto done
if exist f38x_autotest.ihx hex2mif f38x_autotest.ihx
if exist f38x_autotest.hex hex2mif f38x_autotest.hex
:done
echo done
echo Crosside_Action Set_Hex_File F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\f38x_autotest.hex
