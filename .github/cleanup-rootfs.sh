#!/bin/bash

WAIT=1
RMONLY=0

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
	"/opt/hostedtoolcache"
	"/usr/local/.ghcup/"
	"/usr/share/swift"
	"/usr/local/lib/android"
	"/usr/local/share/edge_driver"
	"/usr/local/share/gecko_driver"
	"/usr/local/share/chromedriver-linux64"
	"/usr/local/share/chromium"
	"/home/linuxbrew"
	"/usr/local/share/vcpkg"
	"/usr/share/kotlinc"
	"/usr/local/bin/minikube"
)


function cleanup_packages()
{
	if [[ ${RMONLY} == 0 ]]; then
		apt-get purge -y "${PACKAGES[@]}"
		apt-get autoremove --purge -y
		apt-get clean
	fi
}

function cleanup_paths()
{
	for i in "${PATHS[@]}"; do
		rm -rf "${i}" &
	done
	if [[ ${WAIT} == 1 ]]; then
		wait
	fi
}

if [[ ${WAIT} == 1 ]]; then
	echo "---=== Before ===---"
	df -hT
	cleanup_packages
	cleanup_paths
	echo "---=== After ===---"
	df -hT
else
	cleanup_packages
	cleanup_paths
fi
