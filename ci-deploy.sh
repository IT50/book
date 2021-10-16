cd ..
pip install mkdocs-material
git clone "https://${CI_TOKEN}@github.com/IT50/it50.github.io"
book/build.sh it50.github.io
cd it50.github.io
git config user.name CI
git config user.email ci@it50.org
git add .
git commit -m "Update site"
git push
