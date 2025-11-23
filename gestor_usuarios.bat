@ECHO OFF
ECHO.
COLOR 0C
ECHO Advertencia: EJECUTE ESTE PROGRAMA COMO ADMINISTRADOR PARA CORRECTO FUNCIONAMIENTO
PAUSE>NUL
CLS

:menu
COLOR 0F
ECHO.
ECHO                                   *-*-*-*-*-*-*-*-*-*-*
ECHO                    Menu Gestion Usuarios
ECHO      *-*-*-*-*-*-*-*-*-*-*
ECHO.
ECHO    1 Crear Usuario                            2 Eliminar Usuario       
ECHO    3 Cambiar contrasenya                      4 Ver usuarios
ECHO    5 Hacer administrador a una cuenta local
ECHO    6 Quitar administrador a una cuenta local
ECHO    7 Crear nueva cuenta de administrador
ECHO.
SET /P opcion=Elija que desea hacer: 
if %opcion%==1 GOTO crear usuario
if %opcion%==2 GOTO eliminar usuario
if %opcion%==3 GOTO cambiar contraseña
if %opcion%==4 GOTO ver usuarios
if %opcion%==5 GOTO hacer admin
if %opcion%==6 GOTO quitar admin
if %opcion%==7 GOTO Crear nueva cuenta admin
PAUSE>nul
CLS

:crear usuario
CLS
ECHO.
ECHO Bienvenido a la herramienta de creacion de usuario!
ECHO.
SET /P nombre=Escriba un nombre para el nuevo usuario: 
ECHO.
ECHO Escriba una contrasenya para el nuevo usuario,
SET /P contraseña=o deje este apartado vacio para crearlo sin contrasenya: 
NET USER %nombre% %contraseña% /ADD
ECHO.
ECHO El usuario %nombre% ha sido creado correctamente!
ECHO.
PAUSE>NUL
CLS
GOTO MENU

:eliminar usuario
CLS
ECHO.
ECHO Bienvenido a la herramienta de eliminacion de usuario!
ECHO.
ECHO Advertencia: Esta accion no le pedira contraseña
SET /P nombre1=Escriba el nombre del usuario que desea eliminar: 
NET USER %nombre1% /DELETE
ECHO.
ECHO El usuario %nombre1% ha sido correctamente eliminado!
PAUSE>NUL
CLS
GOTO MENU

:cambiar contraseña
CLS
ECHO.
ECHO Bienvenido a la hrramienta de cambio de contraseña!
ECHO.
SET /P user=Escriba el nombre del usuario al que quiere cambiar la contraseña: 
ECHO.
SET /P contra=Escriba la nueva contraseña: 
ECHO.
NET USER %user% %contra%
ECHO.
ECHO El cambio se ha producido correctamente!

:ver usuarios.
NET USER
PAUSE>NUL
CLS
GOTO menu

:hacer admin
CLS
ECHO.
SET /P admin=Escriba el nombre del usuario al que desea hacer administrador: 
NET LOCALGROUP ADMINISTRADORES /ADD %admin%
ECHO.
ECHO El usuario %admin% es ahora una cuenta de administrador.
PAUSE
CLS
GOTO menu

:quitar admin
CLS
ECHO.
SET /P quitaradmin=Escriba el nombre de usuario que desea hacer cuenta local:
ECHO.
SET /P NET LOCALGROUP ADMINISTRADORES /DEL %quitaradmin%
ECHO.
ECHO El usuario %quitaradmin% ya no es una cuenta de administrador.
PAUSE
CLS
GOTO menu

:crear nueva cuenta de admin
ECHO.
SET /P nombreadmin=Escriba un nombre para la nueva cuenta de admin: 
SET /P contradmin=Escriba la contraseña para esta cuenta: 
NET USER %nombreadmin% %contradmin% /ADD && NET LOCALGROUP ADMINISTRADORES /ADD
ECHO.
ECHO La cuenta de administrador ha sido creada correctamente!
PAUSE
CLS
GOTO menu



