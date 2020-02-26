#!/bin/bash

source trimmomatic-0.36

projectdir=$1
sample=$2
R1=$3
R2=$4
log=$5
basenameR1_no_ext=$6
basenameR1_no_ext=$7

trimmomatic PE -threads 4  -phred33 -trimlog ${log} ${R1} ${R2} ${projectdir}/results/trimmomatic/${sample}/${basenameR1_no_ext}.fq.gz ${projectdir}/results/trimmomatic/${sample}/${basenameR1_no_ext}_unpaired.fq.gz ${projectdir}/results/trimmomatic/${sample}/${basenameR2_no_ext}.fq.gz ${projectdir}/results/trimmomatic/${sample}/${basenameR2_no_ext}_unpaired.fq.gz SLIDINGWINDOW:4:20 MINLEN:30