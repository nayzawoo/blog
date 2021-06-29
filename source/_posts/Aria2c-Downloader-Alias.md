---
title: Aria2c Downloader Alias(osx)
date: 2021-06-29 12:44:02
tags:
---

### Install Aria2

> brew install aria2

### Add alias

```sh
# ~/.zshrc or ~/.bash_profile
function down() {
   echo "Downloading..";
   aria2c -c -x 16 $1 && say "Complete";
}

# -c, --continue => Continue/Resume
# -x => Multiple Connections
```

### Eg Usage

```sh
down https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf
```