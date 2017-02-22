@echo off
::This file was created automatically by CrossIDE to compile with C51.
F:
cd "\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\"
"D:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\example_LCD4bit.c"
if not exist hex2mif.exe goto done
if exist example_LCD4bit.ihx hex2mif example_LCD4bit.ihx
if exist example_LCD4bit.hex hex2mif example_LCD4bit.hex
:done
echo done
echo Crosside_Action Set_Hex_File F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 4\example_LCD4bit.hex
