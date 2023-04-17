#!/bin/bash
# 处理$1并生成同名的.md文件
# output_file="${1%}.md"
# output_file="${1%(BADPREC)%}.md"
filename=${1%.txt}
output_file=${filename}.md
prev_year=""
while read -r line
do
    if [[ "$line" =~ ^([0-9]{4}年[0-9]{2}月[0-9]{2}日) ]]; then
        year=$(echo "$line" | grep -o '[0-9]\{4\}' | head -1)
        if [[ "$year" != "$prev_year" ]]; then
            echo "# ${year}年" >> "$output_file"
            prev_year="$year"
        fi
        title=$(echo "$line" | sed -E 's/^([0-9]{4}年[0-9]{2}月[0-9]{2}日).*/\1/')
        echo "## ${title}" >> "$output_file"
    elif [[ "$line" =~ ^###\ (.+) ]]; then
        echo -e "\n${line}\n" >> "$output_file"
    else
        echo "$line" >> "$output_file"
    fi
done < "$1"
# 输出结果
# cat "$output_file"

