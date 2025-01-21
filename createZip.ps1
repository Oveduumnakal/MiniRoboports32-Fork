Remove-Item "CompactRoboports*zip"
Copy-Item -path ".\src" -Destination ".\CompactRoboports" -Recurse 

$json = Get-Content 'CompactRoboports/info.json' | Out-String | ConvertFrom-Json
Compress-Archive -Path 'CompactRoboports/' -DestinationPath "CompactRoboports$($json.version).zip"

Remove-Item -LiteralPath "CompactRoboports" -Force -Recurse