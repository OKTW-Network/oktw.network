git config user.name "CircleCI"
git config user.email "circleci@oktw.network"

find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;

pwd

git checkout gh-pages
git pull origin gh-pages

mv _site/* .
rm -R _site/

git add -fA
git commit --allow-empty -m "$(git log master -1 --pretty=%B)"
git push origin gh-pages

echo "Deployed successfully"