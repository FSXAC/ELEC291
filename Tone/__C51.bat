@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\"
"C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c"
if not exist hex2mif.exe goto done
if exist melody51.ihx hex2mif melody51.ihx
if exist melody51.hex hex2mif melody51.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.hex
