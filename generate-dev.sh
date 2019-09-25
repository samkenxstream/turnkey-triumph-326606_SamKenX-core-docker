#!/usr/bin/env bash

TOKEN=${1:-ark}
TemplateDir="templates"
DstDir="development/*nix"

for dir in `ls -1 $TemplateDir`; do

	mkdir -p $DstDir/$dir;
    for file in `ls -1 $TemplateDir/$dir`; do
	 sed 's/{token}/'${TOKEN}'/g' $TemplateDir/$dir/$file > $DstDir/$dir/$file
    done
done

