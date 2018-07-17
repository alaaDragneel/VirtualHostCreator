@echo off

echo=

echo *** Author By Mohamed Alaa El-Din Mohamed
echo *** Email moaalaa16@gmail.com
echo *** Github https://www.github.com/alaaDragneel

echo=

echo ********************************************
echo *** Welcome To Quike Virual Host Creator ***
echo ********************************************

echo=

echo *** Notice That This Simple File Work With Xampp Because I Use It More Often It Is Just A Helper For Me

echo=

rem Creating a Tab Variable
set "TAB=	"

rem Paths
set XamppHostsConfig=C:\xampp\apache\conf\extra\httpd-vhosts.conf
set WindowsHostsConfig=C:\Windows\System32\drivers\etc\hosts
rem Set The Host Data
set /p HostName="Please Enter Your Host Name: "
set /p HostAliasName="Please Enter Your Host Alias Name: "
set /p HostPortNumber="Please Enter Your Host Port Number By Defualt Its (80) So Write (80) Or Your Custom Port Number Ex: (8000): "
set /p ProjectDirectory="Please Enter Your Project Directory: "
set /p ServerAdmin="Please Enter Your ServerAdmin: "

echo=

(
 	echo=
	echo ^<VirtualHost *:%HostPortNumber%^>
	echo %TAB%ServerAdmin %ServerAdmin%
	echo %TAB%DocumentRoot "%ProjectDirectory%"
	echo %TAB%ServerName %HostName%
	echo %TAB%ServerAlias %HostAliasName%
	echo %TAB%ErrorLog "c:/xampp/htdocs/ErrorLog.log"
	echo %TAB%CustomLog "c:/xampp/htdocs/Custom.log" common
	echo ^</VirtualHost^>

) >> %XamppHostsConfig%

echo=
echo 127.0.0.1%TAB%%HostName% >> %WindowsHostsConfig%

echo You Can See "%XamppHostsConfig%" To See And Edit Your Host Data From Xampp
echo You Can See "%WindowsHostsConfig%" To See And Edit Your Host Data From Windows

:: Reset All Variables
set HostName=
set HostAliasName=
set HostPortNumber=
set ProjectDirectory=
set ServerAdmin=