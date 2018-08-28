## Images
## Convert an image file to base64 string

## Path to the image you are wanting to convert.
$File = "C:\Software\test.png"

$Image = [System.Drawing.Image]::FromFile($File)
$MemoryStream = New-Object System.IO.MemoryStream
$Image.Save($MemoryStream, $Image.RawFormat)
[System.Byte[]]$Bytes = $MemoryStream.ToArray()
$Base64 = [System.Convert]::ToBase64String($Bytes)
$Image.Dispose()
$MemoryStream.Dispose()

## Location to save the convereted image (will be text).
## This will be used in the main remediation script in the $Base64Image variable
$Base64 | out-file "C:\Software\test.txt" # Save to text file, copy and paste from there to the $Base64Image variable
