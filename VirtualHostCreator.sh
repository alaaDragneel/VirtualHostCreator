#! /bin/bash

echo

# Define Colors
GREEN='\033[0;32m' # Green Color
YELLOW='\033[1;33m' # Yellow Color
BLUE='\033[1;34m' # Blue Color
NC='\033[0m' # No Color

echo -e "${GREEN}*** Author By Mohamed Alaa El-Din Mohamed${NC}"
echo -e "${GREEN}*** Email moaalaa16@gmail.com${NC}"
echo -e "${GREEN}*** Github https://www.github.com/alaaDragneel${NC}"

echo

echo -e "${GREEN}********************************************${NC}"
echo -e "${GREEN}*** Welcome To Quike Virual Host Creator ***${NC}"
echo -e "${GREEN}********************************************${NC}"

echo

echo -e "${YELLOW}*** Notice That This Simple File Work With Apache2 Not Exampp Because I Use It More Often In Linux System It Is Just A Helper For Me${NC}"

echo

# Creating a Tab Variable
TAB="   "

# Paths
Apache2HostsConfig="/etc/apache2/sites-available/000-default.conf"
LinuxHostsConfig="/etc/hosts"
# Set The Host Data
read -p "Please Enter Your Host Name: " HostName
read -p "Please Enter Your Host Alias Name: " HostAliasName
read -p "Please Enter Your Host Port Number By Defualt Its (80) So Write (80) Or Your Custom Port Number Ex: (8000): " HostPortNumber
read -p "Please Enter Your Project Directory: " ProjectDirectory
read -p "Please Enter Your ServerAdmin: " ServerAdmin

(
 	echo

	echo "<VirtualHost *:${HostPortNumber}>"
	echo "${TAB}ServerAdmin ${ServerAdmin}"
	echo -e "${TAB}DocumentRoot \"${ProjectDirectory}\""
	echo "${TAB}ServerName ${HostName}"
	echo "${TAB}ServerAlias ${HostAliasName}"
	echo "${TAB}ErrorLog ${ProjectDirectory}/error.log"
	echo "${TAB}CustomLog ${ProjectDirectory}/access.log combined"
	echo "</VirtualHost>"

    
	

) >> "$Apache2HostsConfig"

echo

echo "127.0.0.1${TAB}$HostName" >> "$LinuxHostsConfig"

echo -e "${BLUE}You Can See \"${Apache2HostsConfig}\" To See And Edit Your Host Data From Apache2${NC}"
echo -e "${BLUE}You Can See \"${LinuxHostsConfig}\" To See And Edit Your Host Data From Linex${NC}"

echo -e "${GREEN}Restarting Apache${NC}"
sudo service apache2 restart