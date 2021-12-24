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