#!/bin/bash

archive_name=separate_snps

echo $archive_name
tar -zcvf ${archive_name}.tar.gz $archive_name
