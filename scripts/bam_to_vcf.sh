#!/bin/bash

source samtools-1.9
source bcftools-1.9

reference=$1
input=$2
output=$3

samtools mpileup -Buf $reference ${input} --output-tags DP | bcftools call --keep-alts --variants-only --multiallelic-caller  | bcftools view - -o ${output}