@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab X\"
"C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab X\CSGOBomb.c"
if not exist hex2mif.exe goto done
if exist CSGOBomb.ihx hex2mif CSGOBomb.ihx
if exist CSGOBomb.hex hex2mif CSGOBomb.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab X\CSGOBomb.hex
