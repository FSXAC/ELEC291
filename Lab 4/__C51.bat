@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\example_frequency.c"
if not exist hex2mif.exe goto done
if exist example_frequency.ihx hex2mif example_frequency.ihx
if exist example_frequency.hex hex2mif example_frequency.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\example_frequency.hex
