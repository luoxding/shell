#!/bin/bash

# 读取文件名
filename=$1

if [ ! -d "out" ]; then
  mkdir out
fi

if [ ! -d "doc" ]; then
  mkdir doc
fi


# ==========================
for f in ./*.txt; 
do
	cp $f ${f%.txt}.md
	sed -i 's/^### /#### /g; s/日 周.*$/日/g; s/^20/### 20/g;' ${f%.txt}.md
done
# ==========================
# 按照###分割文件
csplit -s -z -f out/ "$filename" "/^### /" "{*}"

# 遍历out目录下所有的文件
for file in out/*; do
    # 获取文件内容
    content=$(cat "$file")

    # 从文件内容中获取标题行
    title=$(echo "$content" | grep -m1 "^### ")

    # 从标题行中获取日期部分
    date=$(echo "$title" | cut -c 5-)

    # 将日期部分中的中文字符替换成对应的英文字符
    date=$(echo "$date" | sed 's/年/-/;s/月/-/;s/日//')

    # 获取第一个#标题
    title1=$(echo "$content" | grep -m1 "^# ")

    # 判断是否存在标题4
    if echo "$content" | grep -q "^#### "; then
        # 获取标题4
        title4=$(echo "$content" | grep -m1 "^#### ")

        # 生成新的文件名
        new_filename="$date.$(echo "$title4" | cut -c 6-).md"
    else
        # 生成新的文件名
        new_filename="$date.$(echo "$title1" | cut -c 3-).md"
    fi

    # 将文件重命名，将两个点替换为一个点
    mv "$file" "out/${new_filename//../.}"

done

# 删除out目录下所有文件第一行
sed -i '1d' out/*

for file in out/*.md; do
    pandoc "$file" -o "doc/$(basename "${file%.md}").docx" --top-level-division=chapter
done

# 备份docx文件
zip -r diary_$(date +%Y-%m-%d_%H-%M-%S).zip doc/
