#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import os
import goslate
# import translate

cwd = os.getcwd()
src = cwd + '/activelearning/source/'
dest = cwd + '/activelearning-de/source/'

# Grep all rst files for translation
dir_list = os.listdir(src)
rst_files = [f for f in dir_list if f.endswith('.rst')]
gs = goslate.Goslate()

# Delete index.rst
del rst_files[0]

for rst_file in rst_files:
    with open(src + rst_file, 'r') as en_file:
        en_text = en_file.read()

    de_text = gs.translate(en_text, 'de')
    # de_text = translate.translate(en_text, to_lang='de')

    with open(dest + rst_file, 'w') as de_file:
        de_file.write(de_text.encode('utf8'))
