#!/bin/bash

echo "========================================"
echo "           图书管理系统启动脚本"
echo "========================================"
echo

echo "正在检查Java环境..."
if ! command -v java &> /dev/null; then
    echo "错误：未找到Java环境，请先安装JDK 8+"
    exit 1
fi

echo "正在检查Maven环境..."
if ! command -v mvn &> /dev/null; then
    echo "错误：未找到Maven环境，请先安装Maven 3.6+"
    exit 1
fi

echo
echo "正在启动图书管理系统..."
echo "请确保MySQL服务已启动，并执行了数据库初始化脚本"
echo

echo "启动命令：mvn tomcat7:run"
echo "访问地址：http://localhost:8080/"
echo
echo "按任意键开始启动..."
read -n 1

mvn tomcat7:run

echo
echo "系统已停止运行" 