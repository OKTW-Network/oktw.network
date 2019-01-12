git config user.name "CircleCI"
git config user.email "circleci@oktw.network"

mv _site ./../
mv .git ./../

rm -rf ./*
cp -R ./../.git ./

git checkout gh-pages

find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;

cp -R ./../_site/* ./

git add -fA
git commit --allow-empty -m "$(git log master -1 --pretty=%B)"
git push origin gh-pages

echo "Deployed successfully"