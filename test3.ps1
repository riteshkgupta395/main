$global:progressPreference = 'silentlyContinue'
$xmsdate=(Get-Date -Format R).ToString()
$headers = @{'x-ms-blob-type' = 'BlockBlob'}
$headers.Add('x-ms-date', $xmsdate)

Compress-Archive -Path .\_diag\* -DestinationPath .\diag.zip -Force

$file=".\diag.zip"

$uri="https://f5d6a183799742f6diag.blob.core.windows.net/test/diag4.zip?sv=2019-12-12&ss=b&srt=o&sp=wx&se=2021-01-26T00:20:26Z&st=2021-01-25T16:20:26Z&spr=https&sig=YhXNI68V2Zr3FckXJSGo2973HyG6Y1OrXTtDnPYoHXk%3D"

Invoke-RestMethod -Uri "$uri" -Method Put -Headers $headers -InFile $file
