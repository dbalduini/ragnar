$RootDir = (Get-Item $PSScriptRoot).parent.FullName
$AppDir = Join-Path $RootDir -ChildPath "app"
$SrcDir = Join-Path $AppDir -ChildPath "src"
$TstDir = Join-Path $AppDir -ChildPath "tests"

echo "Removing python compiled files from directories:"
echo "$SrcDir"
echo "$TstDir"

# Clean app folder
Get-ChildItem -Path $AppDir -Filter .pytest_cache -Recurse | %{$_.FullName} | Remove-Item -Force -Recurse
# Clean src folder
Get-ChildItem -Path $SrcDir -Filter *.pyc -Recurse | %{$_.FullName} | Remove-Item
Get-ChildItem -Path $SrcDir -Filter __pycache__ -Recurse | %{$_.FullName} | Remove-Item -Force -Recurse
# Clean tests folder
Get-ChildItem -Path $TstDir -Filter *.pyc -Recurse | %{$_.FullName} | Remove-Item
Get-ChildItem -Path $TstDir -Filter __pycache__ -Recurse | %{$_.FullName} | Remove-Item -Force -Recurse
