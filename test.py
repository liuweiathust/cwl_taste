#!/usr/bin/env python
from __future__ import print_function
import click

@click.command()
@click.option("--message")
def main(message):
    with open(message, "w") as writer:
        print(message, file=writer)

if __name__ == "__main__":
    main()
