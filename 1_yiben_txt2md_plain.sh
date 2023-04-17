#!/bin/bash
# 一本日记导出纯文本格式处理
# 使用：./yiben_txt2md_plain.sh file.txt

# 检查输入参数数量
if [ $# -ne 1 ]
then
    echo "Usage: shell.sh input_file"
    exit 1
fi

input_file="$1"
output_file="${input_file%.*}.md"

# 删除旧的输出文件
rm -f "$output_file"

# 使用sed命令将文件转化为markdown格式
sed -E -e 's/^([0-9]{4}年[0-9]{2}月[0-9]{2}日) .+$/## \1/' \
       -e 's/^### (.+)$/### \1\n/' \
       -e 's/^(### |## |)[^#].+$/\n&/' \
       -e '/^$/d' \
       "$input_file" > "$output_file"
