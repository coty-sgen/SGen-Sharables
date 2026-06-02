@echo off
cd /d "%~dp0"
echo ==================================================
echo    Publishing SGen decks to GitHub...
echo ==================================================
echo.
git add -A
git commit -m "Update decks %date% %time%"
git branch -M main
git push -u origin main
echo.
echo ==================================================
echo    Done. Your decks are live in a minute or two.
echo    Homepage: https://coty-sgen.github.io/SGen-Sharables/
echo ==================================================
echo.
pause
