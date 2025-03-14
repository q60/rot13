#!/usr/bin/sed -nf
# Due to sed limitations, no output is possible before first line is entered. Many sed games suffer
# from this limitation, and the only real solution is to patch sed^W^W press Enter after launch.
# Busybox sed is unsupported due to input bufferisation.
i\
Enter string to encode:
n
i\
Encoded string:
y/abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM/
p
q
