#!/usr/bin/env python

import os
import pathlib
import subprocess
import time
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-p', '--prefix', default='')
args = parser.parse_args()

count_was = 0

def update_count(count_was):
    print(args.prefix, flush=True)

while True:
    update_count(count_was)
    time.sleep(10)

