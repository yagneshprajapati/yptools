@echo off
color 0A
git pull origin master    
git add -A
git commit -m "Auto commit - Changes made"
git push --force origin master   

echo.
echo Changes pushed successfully.
echo.
