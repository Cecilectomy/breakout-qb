@Echo Off

PushD .

CD %~dp0

Call inc\finddosbox.bat

CD ..

If Not Exist build Mkdir build

Echo|Set /p _="Building... "
Call %DBOX_CMD% -conf bin\conf\dosbox.windows.conf -noconsole -exit -c "BIN\BUILD\DOS.BAT" -c "exit" >NUL 2>&1 && (Echo done) || (
    Echo failed!
    Pause
    Exit 1
)

@REM Echo|Set /p _="Copying Assets... "
@REM Echo d | XCopy /q/s/e/h/y assets build\assets >NUL 2>&1 && (Echo done) || (
@REM     Echo failed!
@REM     Pause
@REM     Exit 1
@REM )

PopD
