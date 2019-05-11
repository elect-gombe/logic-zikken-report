#!/bin/bash
# ==tex build script==

#replace `。` to `．`, etc...
grep -l '。' ./*.tex | xargs sed -i.bak -e 's/。/．/g'
grep -l '、' ./*.tex | xargs sed -i.bak -e 's/、/，/g'

grep -l '。' ./*/*.tex | xargs sed -i.bak -e 's/。/．/g'
grep -l '、' ./*/*.tex | xargs sed -i.bak -e 's/、/，/g'

platex paper.tex

#convert dvi => pdf
dvipdfm paper.dvi

# title is including some private contents, cannot be open

#concatenate, if you dont't have pdftk, install or comment out?
#mv paper.pdf _.pdf
#pdftk title.pdf _.pdf cat output paper.pdf

#display pdf
evince paper.pdf 
