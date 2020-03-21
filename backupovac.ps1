$NAPOSLEDY_ZALOHOVANO = (Get-Content -Path .\last_backup.log)
$DNESNI_DATUM = (Get-Date -Format FileDate)

if ($NAPOSLEDY_ZALOHOVANO -lt $DNESNI_DATUM) {
 Copy-Item -Path $env:APPDATA\StardewValley\* -Recurse -Force
 git add .
 git commit -m "new backup"
 git push
 Get-Date -Format FileDate | Out-File -FilePath .\last_backup.log
}
