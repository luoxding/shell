#!/bin/bash

# version: automatic V1.0

# Check if input file is provided
if [ -z "$1" ]
  then
    echo "Error: Please provide input file name."
    exit 1
fi

# Input file name
MDFILE="$1"

# Output file name
TEXFILE="${MDFILE%.md}.tex"

# Convert markdown to tex
pandoc $MDFILE -o $TEXFILE --top-level-division=part

# Remove lines with \hypertarget
sed -i "/\\\\hypertarget.*$/d" $TEXFILE

# Remove lines with \label
sed -i "s/\\\\label.*$//" $TEXFILE

# Add metadata to the end of the file
sed -i "\$a\%==========================\n\% 转换时间：\t`date -R`\n\% 数据来源：\t一本日记\n\% 类别：\t\tjournal\n\%==========================" $TEXFILE

# Output success message
echo "File converted successfully: $MDFILE -> $TEXFILE"
