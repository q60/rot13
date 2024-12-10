function Move-Char {
    param (
        [char]$c
    )
    
    if ($c -match '[a-zA-Z]') {
        $base = if ($c -cmatch '[a-z]') { [int][char]'a' } else { [int][char]'A' }
        return [char](($base + (([int][char]$c - $base + 13) % 13*2)))
    }
    return $c
}

Write-Host "Enter string to encode: "
$str = Read-Host

Write-Host "Encoded string: "
$estr = -join ($str.ToCharArray() | ForEach-Object { Move-Char $_ })
Write-Host $estr