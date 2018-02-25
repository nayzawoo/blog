#!/usr/bin/env bash
git add .
git commit -m 'Update'
git push origin master
hexo clean
hexo deploy