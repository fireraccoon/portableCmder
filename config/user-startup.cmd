:: use this file to run your own startup commands
:: use @ in front of the command to prevent printing the command

:: @call "C:\Program Files\Git/cmd/start-ssh-agent.cmd
:: @set PATH=%CMDER_ROOT%\vendor\whatever;%PATH%

@cd /D %CMDER_ROOT%
@IF EXIST .git (
echo checking config updates ...
    git pull
) ELSE (
:: Clone in current directory
    echo Getting config ...
    git clone https://github.com/fireraccoon/portableCmder.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard
    echo Reboot cmder in order to have the latest changes
)

:: Set Home
@set HOME=%CMDER_ROOT%\home
@IF NOT EXIST %HOME% ( @md %HOME% )
@cd /D %HOME%

:: Set Vendor
@set VENDOR=%CMDER_ROOT%\vendor

:: Common Apps (might need to be manually downloaded

:: Node
@set PATH=%VENDOR%\nodejs;%PATH%

:: PYTHON
@set PATH=%VENDOR%\PortablePython2-7-6-1\App;%PATH%

:: EMACS
@set PATH=%VENDOR%\emacs\bin;%PATH%




