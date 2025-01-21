Remove-Item "MiniRoboports*zip"
Copy-Item -path ".\src" -Destination ".\MiniRoboports" -Recurse 

$json = Get-Content 'MiniRoboports/info.json' | Out-String | ConvertFrom-Json
Compress-Archive -Path 'MiniRoboports/' -DestinationPath "MiniRoboports_$($json.version).zip"

Remove-Item -LiteralPath "MiniRoboports" -Force -Recurse