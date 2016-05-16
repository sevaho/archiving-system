echo "Installing Chocolatey..."
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
echo "Chocolatey installed!"

echo "Installing .NET 4.5"
cinst dotnet4.5 -y
echo ".NET 4.5 installed!"

echo "Installing SQL Server 2014 Express"
cinst mssqlserver2014express -y
echo "SQL Server installed!"
