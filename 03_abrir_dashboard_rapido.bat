@echo off
title 03 - Abrir Dashboard Sompo
cd /d "%~dp0"
echo ============================================
echo Abrindo Dashboard Streamlit...
echo Pasta atual: %cd%
echo ============================================
python -m streamlit run dashboard\app.py
echo.
echo Se o dashboard fechou, leia o erro acima e envie print.
pause
