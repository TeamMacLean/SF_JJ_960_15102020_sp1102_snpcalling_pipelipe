#!/bin/bash

source bowtie2-2.3.5
source samtools=1.9

sample=$1
reference=$2
R1files=$3
R2files=$4
output=$5


bowtie2 --threads 4 --no-unal --rg-id ${sample} --rg ${sample} -x ${reference} -1 ${R1files} -2 ${R2files} | samtools view -b | samtools sort -o ${output} && samtools index ${output}