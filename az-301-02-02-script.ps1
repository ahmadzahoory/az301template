# Set execution policy
Set-ExecutionPolicy Unrestricted -Force
New-Item -ItemType directory -Path 'C:\temp'

# Set TLS
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

# Install IIS and Web Management Tools.
Import-Module ServerManager
install-windowsfeature web-server, web-webserver -IncludeAllSubFeature
install-windowsfeature web-mgmt-tools

# Download the files for our web application.
Set-Location -Path C:\inetpub\wwwroot

$shell_app = new-object -com shell.application
(New-Object System.Net.WebClient).DownloadFile("https://bitbucket.org/ahmadzahoory/az301template/downloads/Az-301-02-02-Code.zip", (Get-Location).Path + "\Az-301-02-02-Code.zip")

$zipfile = $shell_app.Namespace((Get-Location).Path + "\Az-301-02-02-Code.zip")
$destination = $shell_app.Namespace((Get-Location).Path)
$destination.copyHere($zipfile.items())

# Create the web app in IIS
New-WebApplication -Name netapp -PhysicalPath c:\inetpub\wwwroot\cosmos-db-website -Site "Default Web Site" -force

# Download website code from Github
mkdir c:\net-core

# Download .Net Core Windows Hosting
Invoke-WebRequest https://bitbucket.org/ahmadzahoory/az301template/downloads/Az-301-02-02-Dotnet-Hosting.zip -OutFile c:\net-core\Az-301-02-02-Dotnet-Hosting.zip

# Unzip .zip file
Expand-Archive c:\net-core\Az-301-02-02-Dotnet-Hosting.zip -DestinationPath c:\net-core\

# Install .Net Core Windows Hosting
Start-Process -Wait -FilePath "c:\net-core\dotnet-hosting-2.1.12-win.exe" -ArgumentList "/S" -PassThru -NoNewWindow

# Download SQL Server Management Studio (SSMS)
Invoke-WebRequest https://aka.ms/ssmsfullsetup -OutFile c:\net-core\ssms-setup-enu.exe

# Install SQL Server Management Studio (SSMS)
Start-Process -Wait -FilePath "c:\net-core\ssms-setup-enu.exe" -ArgumentList "/S" -PassThru -NoNewWindow

#End
