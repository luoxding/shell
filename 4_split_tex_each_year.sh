#!/usr/bin/bash

dir=src

if [ ! -d "$dir" ]; then
  mkdir $dir
fi
# mkdir -p $dir

for f in *.tex; do

while read -r line; do

if [[ ! ("$line" =~ ^%) ]]; then

if [[ "$line" =~ 'chapter' ]]; then

# nice
#file=$(echo "$line" | grep -Po '[0-9][0-9][0-9][0-9]')
file=$(echo "$line" | grep -Po '2[0][0-3][0-9]')
		#file=$(echo "$line" | grep -Po '(?<=\{)\([0-9]\+\)(?=\})')
# V
# 无效
# file=$(echo "$line" | grep -Po '(?<=\{)[0-9][0-9][0-9][0-9](?=\})')
#V file=$(echo "$line" | grep -Po '(?<=\{).*(?=\})')

#continue
# 输出文件抹掉chapter那一行
fi
[[ -n "$file" ]] && echo "$line" >> "$dir/$file.tex"
fi
done < $f
done
