#!/bin/sh
# catalina.out-gz_MoveToS3 (created May 2019)

# this script recursively moves all files which mach certain pattern
# from a specified EC2 directory to a specified S3 bucket

set -e

# variables
source_path=PATH
destination_path=PATH
files_to_move=catalina.out-*.gz

aws s3 mv ${source_path} s3://${destination_path} --recursive --exclude "*" --include "${files_to_move}" >/dev/null 2>&1
