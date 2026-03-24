@echo off
cls
echo ================================
echo Welcome to the KMS Activation Script
echo ================================

:: Prompt user for Windows version
echo Please select your Windows version:
echo 1. Windows 11 Home
echo 2. Windows 11 Pro
echo 3. Windows 11 Pro Education
echo 4. Windows 11 Pro for Workstations
echo 5. Windows 11 Enterprise
echo 6. Windows 11 Enterprise LTSC
echo 7. Windows 10 Pro
echo 8. Windows 10 Home
echo 9. Windows 10 Pro Education
echo 10. Windows 10 Pro for Workstations
echo 11. Windows 10 Education
echo 12. Windows 10 Enterprise
echo 13. Windows 10 Enterprise LTSC 2019
echo 14. Windows 10 Enterprise LTSC 2021
echo 15. Windows 8.1 Pro
echo 16. Windows 8.1 Enterprise
echo 17. Windows 8 Pro
echo 18. Windows 8 Enterprise
echo 19. Windows 7 Pro
echo 20. Windows 7 Enterprise
set /p choice="Enter the number corresponding to your version: "

:: Assign KMS key based on choice
if "%choice%"=="1" set key=TX9XD‑98N7V‑6WMQ6‑BX7FG‑H8Q99
if "%choice%"=="2" set key=W269N‑WFGWX‑YVC9B‑4J6C9‑T83GX
if "%choice%"=="3" set key=8XH2H‑2N4C4‑C7S3D‑XJ4VB‑4R3GQ
if "%choice%"=="4" set key=P6VDJ‑52J8F‑4M3K8‑3J8CG‑H8F42
if "%choice%"=="5" set key=NPPR9‑FWD84‑WJ9W3‑DYCG2‑P7C4P
if "%choice%"=="6" set key=92NFX‑8DJJP‑G2RJJ‑4MW4P‑6V7FW
if "%choice%"=="7" set key=W269N‑WFGWX‑YVC9B‑4J6C9‑T83GX
if "%choice%"=="8" set key=TX9XD‑98N7V‑6WMQ6‑BX7FG‑H8Q99
if "%choice%"=="9" set key=8XNXP‑DPV28‑7YBR5‑3D6GX‑X84FV
if "%choice%"=="10" set key=NRG8B‑3KQ3T‑TXMQR‑8DTC9‑W3V78
if "%choice%"=="11" set key=YNMGQ‑4CPRK‑NRRF7‑CWGCJ‑6XTG4
if "%choice%"=="12" set key=NPPR9‑FWDCX‑T7X7T‑PJPWH‑HFD8F
if "%choice%"=="13" set key=M7XTQ‑NPH2C‑P7X7C‑JTH9T‑2B7Q8
if "%choice%"=="14" set key=WNMTR‑4C88C‑V6MGY‑QYWQX‑WFGQ9
if "%choice%"=="15" set key=GCRJD‑8NW9H‑F2CDX‑CCM8D‑9D6T9
if "%choice%"=="16" set key=MHF9N‑XY6XB‑WV7RT‑XQ6F9‑W8G9G
if "%choice%"=="17" set key=NG4HW‑VH26C‑733KW‑K6F98‑J8CK4
if "%choice%"=="18" set key=32JNW‑9KQ84‑P47T8‑D8GGY‑CGY8K
if "%choice%"=="19" set key=FJ82H‑XT6CR‑J8D7P‑XQJJ2‑GQ7TG
if "%choice%"=="20" set key=33PXH‑7Y6KF‑2VJC9‑XBBR8‑HVTHH

:: Check if a key was selected
if "%key%"=="" (
    echo Invalid choice. Please try again.
    pause
    exit /b
)

:: Install the key and configure KMS
echo Installing the key...
slmgr /ipk "%key%"
slmgr /skms kms9.msguides.com
slmgr /ato

echo Key has been installed and KMS server set.
pause
