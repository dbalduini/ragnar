$RootDir = (Get-Item $PSScriptRoot).parent.FullName
$AppDir = Join-Path $RootDir -ChildPath "app"
$Dockerfile = "dockerfiles\spark\Dockerfile"

echo "$Dockerfile"

pushd $RootDir
docker build -f $Dockerfile -t ragnar/spark .
popd
