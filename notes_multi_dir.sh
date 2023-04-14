#!/bin/bash

# version: 20230404
# 笔记根目录
ROOT_DIR="$PWD/Notes"
# ROOT_DIR="$HOME/Documents/Notes"
# ROOT_DIR="$HOME/Documents/$(date +%Y)_Notes"

# 文件夹体系
DIR0=000_Inbox
DIR1=001_Projects
DIR2=002_Areas
DIR3=003_Resources
DIR4=004_Archives
# DEMO="$(date +%Y%m%d)_demo.md"
DEMO=index.md
READ=README.md

# 删除已有目录
if [ -d "$ROOT_DIR" ]; then
	rm -rf $ROOT_DIR
fi
# 创建笔记项目文件夹
if [ ! -d "$ROOT_DIR" ]; then
	mkdir -p $ROOT_DIR
fi
# 创建笔记分类文件夹

# 00 Inbox
mkdir -p $ROOT_DIR/$DIR0/{010_Draft,Map,Card,SimpRead}
# 01 Projects
mkdir -p $ROOT_DIR/$DIR1/{Notes,Daily,Weekly,Plans,Reviews}
# 02 Areas
mkdir -p $ROOT_DIR/$DIR2/{Diary/$(date +%Y)/{Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec},Linux/{Shell,Command,System,Application,Config,Scripts},LaTeX/{example,style,extension,other}}
# 03 Resources
mkdir -p $ROOT_DIR/$DIR3/{Extras/{Attachements,Templaters},Info,Books,Articles,Office,Report,Research}
# 04 Archives
mkdir -p $ROOT_DIR/$DIR4/{$(date +%Y),Documents,Images}

# 创建示例文件
echo -e "---\ntitle: \"The Title\"\ndate: \"$(date +%F" "%T)\"\ncategory: \"unknow\"\ntags: \"unknow\"\n---\n\n## STEP 1\n\n### section\n\n### list\n\n- item 1\n- item 2" > $ROOT_DIR/$DEMO

# 查找所有空的子目录并复制文件
find $ROOT_DIR -mindepth 1 -type d -empty -exec cp -r $ROOT_DIR/$DEMO {} \;

echo -e "## STRUCTURE\n$(tree $ROOT_DIR)" > $ROOT_DIR/$READ

# 打印目录树
# tree $ROOT_DIR
cat $ROOT_DIR/$READ

