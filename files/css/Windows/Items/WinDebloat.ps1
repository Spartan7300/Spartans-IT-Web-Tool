# Check if running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    # Relaunch PowerShell as admin and re-run this script
    Start-Process powershell.exe `
        -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" `
        -Verb RunAs
    exit
}

# ===== Elevated section =====

Write-Host "Running as Administrator..." -ForegroundColor Green

& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))

