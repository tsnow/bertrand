#!/bin/bash
set -eux -o pipefail
cd src/
make || true
mv bert ../
cd ..
for i in examples/*; do ./bert $i 1> ./test/$i.stdout 2> ./test/$i.stderr || true; done
git add test
git diff --cached -w
