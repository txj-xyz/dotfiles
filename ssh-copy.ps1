#  Prereqs
#  Install-Module -Name SSH-Sessions; Install-Module -Name Posh-SSH

function ssh-copy {
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$RemoteTarget
    )

    $Username = $RemoteTarget.Substring(0, $RemoteTarget.IndexOf("@"))
    $RemoteHost = $RemoteTarget.Substring($RemoteTarget.IndexOf("@") + 1)

    $publicKeyPath = "$env:USERPROFILE\.ssh\id_rsa.pub"

    if (-not (Test-Path -Path $publicKeyPath)) {
        Write-Error "Public key file not found at $publicKeyPath"
        Exit 1
    }

    $publicKey = Get-Content -Path $publicKeyPath

    $session = New-SSHSession -ComputerName $RemoteHost -Credential $Username
    Invoke-SSHCommand -SessionId $session.SessionId -Command "mkdir -p ~/.ssh"
    Invoke-SSHCommand -SessionId $session.SessionId -Command "echo '$publicKey' >> ~/.ssh/authorized_keys"
    Invoke-SSHCommand -SessionId $session.SessionId -Command "chmod 700 ~/.ssh"
    Invoke-SSHCommand -SessionId $session.SessionId -Command "chmod 600 ~/.ssh/authorized_keys"
    Remove-SSHSession -SessionId $session.SessionId
    
    # Finally login to server.
    ssh $Username@$RemoteHost
}
