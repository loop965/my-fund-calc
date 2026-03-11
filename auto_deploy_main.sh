#!/bin/bash

# -----------------------------
# 自动检测更新并部署到 GitHub Pages (main 分支)
# -----------------------------

# 配置
MAIN_BRANCH="main"
BUILD_DIR="./"          # 构建输出目录，纯 HTML 就是根目录
COMMIT_MSG="自动提交: $(date '+%Y-%m-%d %H:%M:%S')"

echo "-----------------------------"
echo "开始自动部署 (main 分支): $(date)"
echo "-----------------------------"

# 1️⃣ 确保在 main 分支并拉最新代码
git checkout $MAIN_BRANCH
git pull origin $MAIN_BRANCH

# 2️⃣ 检查是否有本地修改
if [[ -n $(git status -s) ]]; then
    echo "检测到本地修改，准备提交..."
    git add .
    git commit -m "$COMMIT_MSG"
    git push origin $MAIN_BRANCH
else
    echo "没有本地更新，跳过提交"
fi

# 3️⃣ 如果有构建步骤（前端项目），取消下面注释
# echo "构建项目..."
# npm install
# npm run build

echo "-----------------------------"
echo "部署完成!"
echo "-----------------------------"