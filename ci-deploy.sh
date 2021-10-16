cd ..
git clone "https://${CI_TOKEN}@github.com/IT50/it50.github.io"
book/build.sh it50.github.io
cd it50.github.io
git config user.name CI
git config user.email ci@it50.org
git add .
echo "Before commit"
git commit -m "Update site"
echo "After commit"
git push
