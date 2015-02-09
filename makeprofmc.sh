#!/bin/bash

#to make profmc simply execute make. Everything else should be detailed in the Makefile
make > log_makeprofmc.log 2>&1
cat log_makeprofmc.log
