@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\PWM.c"
if not exist hex2mif.exe goto done
if exist PWM.ihx hex2mif PWM.ihx
if exist PWM.hex hex2mif PWM.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\PWM.hex
