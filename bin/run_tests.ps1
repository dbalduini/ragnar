$RootDir = (Get-Item $PSScriptRoot).parent.FullName
$AppDir = Join-Path $RootDir -ChildPath "app"

pushd "$AppDir"
$env:PYTHONPATH = "$AppDir"; python -m pytest tests "$args"
popd
