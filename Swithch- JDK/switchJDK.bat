@echo off

rem --- Base Config ����JDK�İ�װĿ¼ ---
:init 
set JAVA_HOME_1_8=C:\Program Files\Java\jdk1.8.0_73
set JAVA_HOME_1_7=C:\Program Files\Java\jdk1.7.0_79
REM set JAVA_HOME_1_6=C:\Program Files\Java\jdk1.6.0_45
:start 
echo ��ǰʹ�õ�JDK �汾: 
java -version 
echo. 
echo ============================================= 
echo jdk�汾�б� 
echo 1.8 
echo 1.7
REM echo 1.6 
echo ============================================= 

:select
set /p opt=��ѡ��jdk�汾�� 
if %opt%==1.8 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_8%
)
if %opt%==1.7 (
    set TARGET_JAVA_HOME=%JAVA_HOME_1_7%
)
REM if %opt%==1.6 (
    REM set TARGET_JAVA_HOME=%JAVA_HOME_1_6%
REM )

echo ��ǰѡ���Java·��:%TARGET_JAVA_HOME%

wmic ENVIRONMENT where "name='JAVA_HOME'" delete
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%TARGET_JAVA_HOME%"

rem -- refresh env ---
call RefreshEnv

echo �밴������˳�!   
pause>nul

@echo on