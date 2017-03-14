@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c"
if not exist hex2mif.exe goto done
if exist MotorControl.ihx hex2mif MotorControl.ihx
if exist MotorControl.hex hex2mif MotorControl.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.hex
