#!/bin/bash

lex test.l
g++ -o test lex.yy.c
