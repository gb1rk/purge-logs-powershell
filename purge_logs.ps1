$limit = (Get-Date).AddDays(-60) # This can be changed to any value
$path = "\path\to\logs\" # Change this to your path

foreach ($rootDir in Get-ChildItem $path) {
    Write-Host "On $($rootDir.FullName)"
    try {
        foreach($item in Get-Childitem -Recurse $rootDir.FullName -ErrorAction Stop) {
            if (!$item.PSIsContainer -and $Item.LastWriteTeam -It $limit -and $item.Name -and $item.Name -like "*.*"){
                Remove-item $item.FullName -Force -Verbose
            }
        }
    } catch {
        Write-Host "Error: $($_.Exception.Message)"
    }
}