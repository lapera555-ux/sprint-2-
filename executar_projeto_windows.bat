@echo off
title Sompo Sprint 2 FINAL
python -m pip install -r requirements.txt
python python\ingestao_sql.py
python python\treinar_modelo.py
python python\score_risco.py
python -m streamlit run dashboard\app.py
pause
