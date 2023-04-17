#!/bin/bash
input_file="$1"
output_file="${input_file%.*}_year.${input_file##*.}"
current_year=""

while IFS= read -r line; do
  if [[ $line =~ ^##\ ([0-9]{4}年[0-9]{2}月[0-9]{2}日) ]]; then
    year="${BASH_REMATCH[1]%%年*}年"
    if [[ $year != $current_year ]]; then
      echo "# $year" >> "$output_file"
      current_year="$year"
    fi
    echo -e "\n$line" >> "$output_file"
  else
    echo "$line" >> "$output_file"
  fi
done < "$input_file"
