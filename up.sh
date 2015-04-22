#!/bin/bash
pdflatex -output-directory files files/yaroslavtsev-cv.tex
git add .
git commit -a -m "up" 
git push origin master

