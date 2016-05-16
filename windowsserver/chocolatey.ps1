echo "Installing Chocolatey..."
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
echo "Chocolatey installed!"

echo "Installing .NET 4.5"
cinst dotnet4.5 -y
echo ".NET 4.5 installed!"

echo "Installing SQL Server 2012 Express"
cinst mssqlserver2012express -y
echo "SQL Server installed!"

echo "Installing SQL Server 2014 Express"
cinst mssqlserver2014express -y
echo "SQL Server installed!"

echo "Upgrading powershell"
choco upgrade powershell -y
echo "PowerShell upgraded!"

echo "Restarting server for PS-upgrade to take place"
Restart-Computer
echo "Computer restarted!"

echo "Installing SSH for windows..."
cinst freesshd -y
echo "FreeSSHd installed!"
