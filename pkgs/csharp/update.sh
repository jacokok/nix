#!/usr/bin/env bash

version=$(gh release list -R dotnet/vscode-csharp --exclude-pre-releases --json tagName,isLatest --jq '.[] | select(.isLatest) | .tagName')
# remove first character
version="${version:1}"

echo $version