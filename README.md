## Introduction

This is a pipeline for snp calling in 52 sp1102 sample data fastq files from the specified folder. The pipeline uses snakemake workflow manageing tool.

The pipeline works out the number of R1 and R2 read files in each sample folder. Sample containing multiple R1 files will be considered having multiple data files.

If a sample containing multiple sample files, the R1 and R2 read files, they  will be aligned to the reference sequence in a single command, however, other steps are done individually for each pair of R1 and R2 files.

## Requirements

These tools need to be sourced before running the pipeline
1) python-3.6.1 with snakemake v5.9
2) trimmomatic v0.36
3) bowtie2 v2.3.5
4) samtools v1.9
5) bcftools v.19

## Steps in the pipeline

1) Quality control using trimmomatic v0.36
2) Reads alignment using bowtie2 v2.3.5
3) SAM to sorted BAM convertion using samtools v1.9
4) vcf file generation from BAM file using bcftools 

## Usage:

To run the pipeline in HPC with job in parallel in interactive mode

snakemake -s scripts/snpcall.snakemake -p --cluster 'sbatch --cpus 2 --mem 20G' --jobs 10

The above command can also be submitted to HPC like this

sbatch -o snakemake_job.log --mem 100 -J snpcall --wrap " snakemake -s scripts/snpcall.snakemake -p --cluster 'sbatch --cpus 2 --mem 20G' --jobs 10 "


