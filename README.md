# shell
整理我的shell脚本

- 笔记
	- 批量创建文件夹

## 日记格式处理

- [一本日记导出文件](https://github.com/luoxding/ObsidianLibrary/blob/main/001_Projects/Diary/一本日记.md)
	- 转ediary导入的docx格式
		- `./yiben2ediary_each_docx.sh diary_20220325_184007.md `
	- markdown
	- latex
	- pdf
	- pandoc


```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

git config user.email "anthony_lambert@live.com"
git config user.name "luoxding"
```

```bash
find ~ -type f -name "*.sh" -exec grep -l "pandoc" {} \; -exec grep -l "txt" {} \; -exec grep -l "tex" {} \;
```