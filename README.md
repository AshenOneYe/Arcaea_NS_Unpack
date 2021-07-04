# Arcaea_NS_Unpack
ns端的Arcaea数据解包

NSP文件解包以后只有一个json和一个pack文件，json记录了各个文件的名称目录以及在pack里的大小和偏移，写了个python脚本进行自动化的资源提取

## Usage
将脚本与解包文件json和pack放置于同一目录

`python ns_arc_unpack.py arc.json arc.pack`

## TODO

解包DLC