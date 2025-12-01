#!/bin/bash

# 1. Build Flutter web with correct base href
flutter build web --base-href /saleem_store/

# 2. Remove old docs folder
rm -rf docs

# 3. Copy new build to docs
cp -r build/web docs

# 4. Commit and push changes
git add .
git commit -m "Update web build"
git push

echo "✅ Flutter web deployed to /docs and pushed to GitHub!"
