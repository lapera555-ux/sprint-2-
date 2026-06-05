@echo off
title 02 - Testar Scripts Python Sompo
cd /d "%~dp0"
echo ============================================
echo Testando ingestao SQL...
echo ============================================
python python\ingestao_sql.py
if errorlevel 1 (
    echo.
    echo ERRO na ingestao SQL.
    pause
    exit /b
)

echo.
echo ============================================
echo Testando treinamento de modelo...
echo ============================================
python python\treinar_modelo.py
if errorlevel 1 (
    echo.
    echo ERRO no treinamento do modelo.
    pause
    exit /b
)

echo.
echo ============================================
echo Testando previsao individual...
echo ============================================
python python\score_risco.py
if errorlevel 1 (
    echo.
    echo ERRO no score de risco.
    pause
    exit /b
)

echo.
echo Todos os scripts executaram com sucesso.
pause
