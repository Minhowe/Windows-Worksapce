@echo off

rem --- Base Config 配置JDK的安装目录 ---
:init 
set JAVA_HOME_1_8=C:\Program Files\Java\jdk1.8.0_11
set JAVA_HOME_1_7=C:\Program Files\Java\jdk1.7.0_45
set JAVA_HOME_1_6=C:\Program Files\Java\jdk1.6.0_45
:start 
echo 当前使用的JDK 版本: 
java -version 
echo. 
echo ============================================= 
echo jdk版本列表 
echo 1.8 
echo 1.7
echo 1.6 
echo ============================================= 

:select
set /p opt=请选择jdk版本： 
if %opt%==1.8 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_8%
)
if %opt%==1.7 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_7%
)
if %opt%==1.6 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_6%
)

echo 当前选择的Java路径:%TARGET_JAVA_HOME%

wmic ENVIRONMENT where "name='JAVA_HOME'" delete
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%TARGET_JAVA_HOME%"

rem -- refresh env ---
call RefreshEnv

echo 请按任意键退出!   
pause>nul

@echo on