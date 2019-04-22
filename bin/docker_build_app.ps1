$RootDir = (Get-Item $PSScriptRoot).parent.FullName
$Dockerfile = "dockerfiles\app\Dockerfile"

echo "$Dockerfile"

pushd $RootDir
docker build -f $Dockerfile -t ragnar/app .
popd
