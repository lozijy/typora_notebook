git add .
echo "正在添加所有新增内容"
commit=""
read -p "请输入commit内容:" commit
git commit -m commit
echo "commit成功"
git push
echo "push成功"
