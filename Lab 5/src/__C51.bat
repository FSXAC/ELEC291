@echo off
::This file was created automatically by CrossIDE to compile with C51.
F:
cd "\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\"
"D:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.c"
if not exist hex2mif.exe goto done
if exist lab5.ihx hex2mif lab5.ihx
if exist lab5.hex hex2mif lab5.hex
:done
echo done
echo Crosside_Action Set_Hex_File F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\src\lab5.hex
