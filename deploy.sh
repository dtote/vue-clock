#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build && npx gh-pages -d dist

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:neeestor08/vue-clock.git main:gh-pages
git push -f git@github.com:neeestor08/vue-clock.git master:gh-pages

cd -