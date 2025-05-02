#!/usr/bin/env python3

# Suppress outputing The Zen of Python
import sys, os
sys.stdout = os.devnull
import this
sys.stdout = sys.__stdout__

print("Encoded string:\n" + input("Enter string to encode:\n").translate(str.maketrans(this.d)))
