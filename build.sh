#!/bin/bash

if ( find /src -maxdepth 0 -empty | read v );
then
  echo "Error: Must mount Go source code into /src directory"
  exit 990
fi

# Grab Go package name
pkgName="$(go list -e -f '{{.ImportComment}}' 2>/dev/null || true)"

if [ -z "$pkgName" ];
then
  echo "Error: Must add canonical import path to root package"
  exit 992
fi

# Grab just first path listed in GOPATH
goPath="${GOPATH%%:*}"

# Construct Go package path
pkgPath="$goPath/src/$pkgName"

# Set-up src directory tree in GOPATH
mkdir -p "$(dirname "$pkgPath")"

# Link source dir into GOPATH
ln -sf /src "$pkgPath"

cd /src
if [ -e vendor ];
then
  rm -rf vendor
fi
if [ -e .env ];
then
  rm -f .env
fi
cd "$pkgPath"
if [ -e glide.lock ];
then
  glide install
fi

go build -tags $APP_ENV -o webapp

cd /src
rm -rf vendor
chmod -R 700 /src
