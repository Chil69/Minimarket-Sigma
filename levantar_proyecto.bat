@echo off
echo ==============================================
echo LEVANTANDO EL PROYECTO PARA LA PRESENTACION
echo ==============================================
echo.
echo Recuerda que debes tener MySQL o XAMPP prendido (Puerto 3306).
echo.
pause

echo Levantando Backend...
start "Backend - Minimarket" cmd.exe /k "npm install && npm run dev"

cd frontend
echo Levantando Frontend...
start "Frontend - Minimarket" cmd.exe /k "npm install && npm run dev"

echo.
echo !Listo! Se abrieron dos ventanas negras de consola. 
echo El frontend deberia abrirse solito en tu navegador.
echo Puedes minimizar esta ventana.
echo Para apagar el proyecto luego de tu presentacion, simplemente cierra las dos ventanas negras.
pause
