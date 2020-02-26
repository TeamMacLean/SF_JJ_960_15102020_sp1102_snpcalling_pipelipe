#!/bin/bash

source bowtie2-2.3.5

bowtie2-build -f $1 $1
