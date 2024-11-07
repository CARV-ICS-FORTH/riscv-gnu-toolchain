#!/bin/bash

PACKAGES=(
	"firefox"
	"google-chrome-stable"
	"microsoft-edge-stable"
	"php-pear"
	"ruby-full"
	"^aspnetcore-.*"
	"^dotnet-.*"
	"powershell*"
)

PATHS=(
	"/usr/local/bin/aliyun"
	"/usr/local/bin/aws"
	"/usr/local/bin/aws_completer"
	"/usr/local/aws-cli"
	"/usr/local/bin/sam"
	"/usr/local/aws-sam-cli"
	"/usr/local/bin/azcopy"
	"/usr/local/bin/azcopy10"
	"/opt/az/azcliextensions"
	"/usr/local/bin/bazel"
	"/usr/local/bin/bicep"
	"/opt/hostedtoolcache"
	"/usr/share/dotnet"
	"/usr/local/bin/rebar3"
	"/usr/local/share/gecko_driver"
	"/usr/local/share/chromedriver-linux64"
	"/usr/local/share/chromium"
	"/opt/ghc"
	"/usr/local/.ghcup/"
	"/home/linuxbrew"
	"/usr/share/apache-maven-*"
	"/usr/share/gradle"
	"/usr/local/julia*"
	"/usr/share/kotlinc"
	"/usr/local/bin/minikube"
	"/usr/local/share/edge_driver"
	"/usr/local/lib/node_modules/*"
	"/usr/local/bin/oc"
	"/usr/local/bin/oras"
	"/usr/share/java/selenium-server-*"
	"/usr/share/swift"
	"/usr/local/share/vcpkg"
	"/usr/local/lib/android"
)


function cleanup_packages()
{
	apt-get purge -y "${PACKAGES[@]}"
	apt-get autoremove --purge -y
	apt-get clean
}

function cleanup_paths()
{
	echo "---=== Before ===---"
	df -hT
	for i in "${PATHS[@]}"; do
		du -s -h "${i}"
		rm -rf "${i}"
	done
	echo "---=== After ===---"
	df -hT
}

cleanup_packages
cleanup_paths
