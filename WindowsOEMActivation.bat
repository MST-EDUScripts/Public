@echo off
FOR /F "skip=1" %%A IN ('wmic path SoftwareLicensingService get OA3xOriginalProductKey') DO  (
SET "ProductKey=%%A"
goto InstallKey
)

:InstallKey
IF [%ProductKey%]==[] (
echo No key present
) ELSE (
echo Installing %ProductKey%
slmgr /ipk %ProductKey%
slmgr /ato
)
