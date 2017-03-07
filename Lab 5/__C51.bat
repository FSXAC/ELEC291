@echo off
::This file was created automatically by CrossIDE to compile with C51.
F:
cd "\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\"
"D:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.c"
if not exist hex2mif.exe goto done
if exist example_ADC.ihx hex2mif example_ADC.ihx
if exist example_ADC.hex hex2mif example_ADC.hex
:done
echo done
echo Crosside_Action Set_Hex_File F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 5\example_ADC.hex
