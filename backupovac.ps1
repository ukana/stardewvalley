$NAPOSLEDY_ZALOHOVANO = (Get-Content -Path .\last_backup.log)
$DNESNI_DATUM = (Get-Date -Format FileDate)

if ($NAPOSLEDY_ZALOHOVANO -lt $DNESNI_DATUM) {
 Get-Date -Format FileDate | Out-File -FilePath .\last_backup.log
 Copy-Item -Path $env:APPDATA\StardewValley\* -Recurse -Force
 git add .
 git commit -m "new backup"
 git push
 Write-Host "Backed up."
}
else {
 Write-Host "Already backed up today."
}
& '.\Stardew Valley.url'