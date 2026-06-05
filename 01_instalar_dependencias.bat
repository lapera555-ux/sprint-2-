@echo off
title 01 - Instalar Dependencias Sompo
cd /d "%~dp0"
echo ============================================
echo Instalando dependencias do projeto Sompo...
echo Pasta atual: %cd%
echo ============================================
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
echo.
echo Finalizado. Se apareceu erro acima, tire print e envie.
pause
