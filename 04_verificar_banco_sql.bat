@echo off
title 04 - Verificar Banco SQL
cd /d "%~dp0"
echo ============================================
echo Verificando banco SQLite do projeto...
echo ============================================
python python\verificar_banco_sql.py
echo.
pause
