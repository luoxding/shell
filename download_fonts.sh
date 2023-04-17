#!/bin/bash

mkdir fonts

# Source Han Serif

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SimplifiedChinese/SourceHanSerifSC-ExtraLight.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SimplifiedChinese/SourceHanSerifSC-Light.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SimplifiedChinese/SourceHanSerifSC-Regular.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SimplifiedChinese/SourceHanSerifSC-Medium.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SimplifiedChinese/SourceHanSerifSC-SemiBold.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SimplifiedChinese/SourceHanSerifSC-Bold.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SimplifiedChinese/SourceHanSerifSC-Heavy.otf

# Source Han Sans

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SimplifiedChinese/SourceHanSansSC-ExtraLight.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SimplifiedChinese/SourceHanSansSC-Light.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SimplifiedChinese/SourceHanSansSC-Regular.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SimplifiedChinese/SourceHanSansSC-Medium.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SimplifiedChinese/SourceHanSansSC-Normal.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SimplifiedChinese/SourceHanSansSC-Bold.otf

wget -q -P ./fonts/ https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SimplifiedChinese/SourceHanSansSC-Heavy.otf

# DejaVu fonts

wget -q -P ./ https://github.com/dejavu-fonts/dejavu-fonts/releases/download/version_2_37/dejavu-fonts-ttf-2.37.zip

unzip -q -d ./ ./dejavu-fonts-ttf-2.37.zip

mv ./dejavu-fonts-ttf-2.37/ttf/* ./fonts/

tree ./fonts/
