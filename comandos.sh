set -x

declare -r apacheMavenDownloadUrl="http://apache.cbox.biz/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz" declare -r directoryName="mvn/"

if $apacheMavenDownloadUrl =~ ([^/]+)-bin.tar.gz$ then declare -r resultFileName=$BASH_REMATCH declare -r resultDirectoryName=${BASH_REMATCH[1]} else printf "\nIncorrcet format of Apache Maven download url!\n" exit 1 fi

mkdir $directoryName cd $directoryName

wget $apacheMavenDownloadUrl tar -zxf $resultFileName declare -r workingDir=$(pwd)

ln -f -s "$workingDir/$resultDirectoryName/bin/mvn" /usr/local/bin/mvn rm -v $resultFileName

printf "\nMaven 3 is installed!\n"
