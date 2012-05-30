#!/bin/bash
git submodule add $1 bundle/$(basename "$1" .git)
