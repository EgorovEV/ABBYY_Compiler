# ABBYY_Compiler
[![Build Status](https://travis-ci.org/EgorovEV/ABBYY_Compiler.svg?branch=develop)](https://travis-ci.org/EgorovEV/ABBYY_Compiler)

A compiler for simple Java-like programming language

By some ABBYY students <br />

## Introduction
Welcome wanderer! <br />

## Dependencies:

This code makes use of the following libraries: <br />
flex, bison, g++ <br />

To install required dependencies run:<br />
...<br />

## Materials:
https://drive.google.com/drive/u/0/folders/1Q7nlEMtqZIvuYCEbITspLKm4TuCq4KLL <br />

### How to run the compiler:
```asm
make
cat test.txt | ./parser
```
Для просмотра .dot файла-- визуализация грамматики:
```asm
sudo apt install xdot
xdot grammar_for_Lexical_analizer.dot
```
Может повисеть секунд 30-- минуту. <br />
Флаги для тестов:
```asm
-pl - print lexer debug info
-pr - print bison debug info
```


## Main Results
connected flex with bison<br />
expand grammar<br />
create if-else, tests are required <br />


## Useful links
how2start: http://rus-linux.net/lib.php?name=/MyLDP/algol/lex-yacc-howto.html <br />
bison docs: ftp://ftp.auckland.ac.nz/pub/gnu/Manuals/bison-1.35/html_chapter/bison_8.html <br />

