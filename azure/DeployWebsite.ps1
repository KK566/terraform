#Getting credentials

$Credentials = Get-Credential

#Creating two session because our vm's share the same -ComputerName but have different WinRM ports

$session1 = New-PSSession -ComputerName myrg.germanywestcentral.cloudapp.azure.com `
            -Port 10000 -UseSSL -SessionOption (New-PSSessionOption -SkipCACheck `
            -SkipCNCheck) -Credential $cred

$session2 = New-PSSession -ComputerName myrg.germanywestcentral.cloudapp.azure.com `
            -Port 10001 -UseSSL -SessionOption (New-PSSessionOption -SkipCACheck `
            -SkipCNCheck) -Credential $cred

$localWebsite = ".\sites\*.*"
$destination = "C:\inetpub\wwwroot"

Invoke-Command -Session $session1 -ScriptBlock {
    Install-WindowsFeature -Name Web-Server
    Remove-Item "$destination\*" -Recurse -Include *.*
}
Invoke-Command -Session $session2 -ScriptBlock { 
    Install-WindowsFeature -Name Web-Server
    Remove-Item "$destination\*" -Recurse -Include *.*
}

Copy-Item -Path $localWebsite -Destination $destination -ToSession $session1
Copy-Item -Path $localWebsite -Destination $destination -ToSession $session2
