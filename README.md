# Luban导表插件在Unity中的使用示例

基于 [luban_examples](https://github.com/focus-creative-games/luban_examples) 内的 [Csharp_Unity_Json ](https://github.com/focus-creative-games/luban_examples/tree/main/Projects/Csharp_Unity_json) 实现

# 目录结构

考虑到源表格表格无需放在Unity工程内（工程内仅需已导出的数据），因此目录结构划分如下：

```
│─Client : Unity工程目录
│  └─Assets
│     ├─Plugins
│     │  └─LubanLib : Luban插件相关
│     ├─Scenes
│     │  └─SampleScene.unity : 示例场景
│     ├─Scripts
│     │  └─Main.cs : 入口脚本
│     │  └─TableManager.cs : 表格管理器类
│     └─TableData : 表格导出数据及脚本文件夹
│         └─Json : 表格导出Json数据文件夹
└─Public : 源表格工程目录
    ├─Tables : 源excel表格文件夹
    └─Tools : Luban插件相关
```

# 配置流程

## 表格导入

从官方源示例项目 [luban_examples](https://github.com/focus-creative-games/luban_examples) 内复制示例模板文件夹 [MiniDesignerConfigsTemplate](https://github.com/focus-creative-games/luban_examples/tree/main/MiniDesignerConfigsTemplate) 到Public，重命名为Tables

## 插件导入

复制 [luban_examples](https://github.com/focus-creative-games/luban_examples) 中的Tools导表工具到 Public\Tools

复制 [Csharp_Unity_Json ](https://github.com/focus-creative-games/luban_examples/tree/main/Projects/Csharp_Unity_json) 中的 Assets\LubanLib 到本项目的Client\Assets\Plugins 下，开启PlayerSetting的unsafe

复制 [Csharp_Unity_Json ](https://github.com/focus-creative-games/luban_examples/tree/main/Projects/Csharp_Unity_json) 中的 gen_code_json.bat 到 Public

## 编写导表命令

用记事本或VSCode对 gen_code_json.bat 进行修改：

```bash
rem 不显示后续命令行及当前命令行
@echo off
chcp 65001

echo ----------------------------------------
echo 【TIME】%DATE%
echo 【OPERATION】Luban开始导表...
echo ----------------------------------------

cd..

rem 项目根目录
set PROJECT_HOME=%cd%
rem 表格工具根目录
set TABLE_ROOT=%PROJECT_HOME%\Public
rem Unity项目根目录
set UNITY_ROOT=%PROJECT_HOME%\Client
rem 源表目录
set CONF_ROOT=%TABLE_ROOT%\Tables
rem 导出表数据目录
set OUTPUT_ROOT=%UNITY_ROOT%\Assets\TableData
rem 导表工具路径（纯本地模型）
set GEN_CLIENT=%TABLE_ROOT%\Tools\Luban.ClientServer\Luban.ClientServer.exe
rem 导表dll
set Luban.ClientServer.dll=%TABLE_ROOT%\Tools\Luban.ClientServer\Luban.ClientServer.dll


echo 【OPERATION】清除Json文件夹
del /S /Q /F %OUTPUT_ROOT%\Json


%GEN_CLIENT%  -j cfg --^
 -d %CONF_ROOT%\Defines\__root__.xml ^
 --input_data_dir %CONF_ROOT%\Datas ^
 --output_code_dir %OUTPUT_ROOT% ^
 --output_data_dir %OUTPUT_ROOT%\Json ^
 --gen_types code_cs_unity_json,data_json ^
 -s all 

pause
```

## 执行导表命令

双击执行 gen_code_json.bat ，正常的话会显示成功日志



# TODO

若 gen_code_json.bat 内不执行 `del /S /Q /F %OUTPUT_ROOT%\Json` 清除Json文件夹，会偶现导表失败（没导出数据），原因待查

