#!/bin/bash
# version: automatic V1.0

# ========================== MARKDOWN
for f in ./*.txt; 
do
	cp $f ${f%.txt}.md
	sed -i 's/^### /#### /g; s/日 周.*$/日/g; s/^20/### 20/g;' ${f%.txt}.md
#	sed -i 's/^### /#### /g; s/日 周.*$/日/g; s/^20/### 20/g; 1i\# 日记卷\n' ${f%.txt}.md
for i in {2004..2022}; 
do
	sed -i "0,/^### $i年/ s/### $i年/## $i年\n\n### $i年/" ${f%.txt}.md
done
done
# ========================== TEX
for f in ./*.md
do
 pandoc $f -o ${f%.md}.tex --top-level-division=part
 #pandoc $f -o ${f%.md}.tex --top-level-division=part
#pandoc $MDFILE -o $TEXFILE --top-level-division=part
# 5efault|section|chapter|part
sed -i "/\\\\hypertarget.*$/d" ${f%.md}.tex
sed -i "s/\\\\label.*$//" ${f%.md}.tex
#echo "% create:	`date`" >> ${f%.md}.tex
#echo % create:		`date +"%Y-%m-%d %H:%M:%S"` >> ${f%.md}.tex 
sed -i "\$a\%==========================\n\% 转换时间：\t`date -R`\n\% 数据来源：\t一本日记\n\% 类别：\t\tjournal\n\%==========================" ${f%.md}.tex
#sed -i "\$a\%==========================\n\% 转换时间：\t`date "+%Y-%m-%d %H:%M:%S"`\n\% 数据来源：\t一本日记\n\% 类别：\t\tjournal\n\%==========================" ${f%.md}.tex
#vv sed -i "\$i\% 转换时间：\t`(date "+%Y-%m-%d %H\:%M")`\n\% 数据来源：\t一本日记\n\% categories:\tjournal" ${f%.md}.tex
#sed -i "1i\% 转换时间：`date`\n\% 数 据 来 源 ： 一本日记\n\%      categories: journal" $TEXFILE  
#	pandoc -f markdown -t pdf head/introduction.md $f -o ${f%.md}.pdf --pdf-engine "xelatex" --toc --toc-depth 2 --template head/eisvogel --metadata-file head/metadata.yml --listings 
done

#rm ../*.tar.gz
#tar zcvf ../diary-$(date +%Y%m%d-%H%M).tar.gz ../riji 
# ========================== splitting

