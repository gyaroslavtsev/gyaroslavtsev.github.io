#!/bin/bash
pdflatex files/yaroslavtsev-cv.tex
git add .
git commit -a -m "up" 
git push origin master

