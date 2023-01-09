set -e 
npm run build
cd dist
git init
git add -A
git commit -m 'deploy'
git push -f https://github.com/Intestine/start-simulator.git main:gh-pages
cd -