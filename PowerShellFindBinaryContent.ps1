$filepath="c:\Windows\System32\atl100.dll"
$fragment=[System.Text.Encoding]::GetEncoding(28591).GetString([System.IO.File]::ReadAllBytes($filepath))
Get-ChildItem –Path "c:\Windows\System32\" -Recurse |
Foreach-Object {
     if ( $_.FullName.Substring($_.FullName.Length-4,4) -eq ".exe" -or $_.FullName.Substring($_.FullName.Length-4,4) -eq ".dll" )
     {
        $i=[System.Text.Encoding]::GetEncoding(28591).GetString([System.IO.File]::ReadAllBytes($_.FullName)).IndexOf($fragment)
        if($i -gt -1) 
        {
            Write-Host "Found: " $_.FullName
            #Write-Host $i
        }
    }
    
}