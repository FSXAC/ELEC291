@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\digitalIO.c"
if not exist hex2mif.exe goto done
if exist digitalIO.ihx hex2mif digitalIO.ihx
if exist digitalIO.hex hex2mif digitalIO.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\digitalIO.hex
