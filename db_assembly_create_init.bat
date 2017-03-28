SETLOCAL

ECHO db_assembly_create_init.bat
CALL %_util%\exit_if_error

@REM Set UTF-8 encoding.
CHCP 65001

SET accumAssemblyPath=%1
IF [%accumAssemblyPath%] EQU [] GOTO BrokenInputParameter


SET sqlScript=%accumAssemblyPath%assemblies.register.sql

@REM Let's clear or create target script file.
TYPE NUL> %sqlScript%

@ECHO.>> %sqlScript%
@ECHO -- This script was generated by our build-server>> %sqlScript%
@ECHO.>> %sqlScript%



@GOTO :EOF

:BrokenInputParameter
ECHO  !#!  Interrupted. Not all input parameters have been set to call this script!
ECHO.
EXIT 333