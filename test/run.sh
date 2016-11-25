#!/bin/bash
set -eux -o pipefail
for i in examples/*; do ./bert $i 1> ./test/$i.stdout 2> ./test/$i.stderr; done
git diff
