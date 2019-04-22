$RootDir = (Get-Item $PSScriptRoot).parent.FullName
$Dockerfile = "dockerfiles\pyspark\Dockerfile"

echo "$Dockerfile"

pushd $RootDir
docker build -f $Dockerfile -t ragnar/pyspark --build-arg spark_dir=spark-2.4.1-bin-hadoop2.7 .
popd
