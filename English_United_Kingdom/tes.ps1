$source = "https://voip.omanski.pl/tftp/English_United_Kingdom/"
$files = Invoke-WebRequest -Uri $source | Select-Object -ExpandProperty Links | Where-Object { $_.href -match "\.xml$|\.cfg$|\.txt$|\.bin$" }

foreach ($file in $files) {
    $url = $source + $file.href
    $filename = $file.href
    Invoke-WebRequest -Uri $url -OutFile $filename
}
