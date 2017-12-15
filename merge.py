from __future__ import print_function
import sys

with open("merge.txt", "w") as writer:
    for filename in sys.argv[1:]:
        with open(filename) as reader:
            for line in reader:
                print(line.strip(), file=writer)
