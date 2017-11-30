#!/bin/sh

module load SRAToolkit/2.8.2

## Set up directory structure

mkdir RawReads Metadata ProcessedReads PublicData QualityControl QualityControl/raw QualityControl/trimmed


## Get data
cd RawReads
cp ~/Crangiferina/CrX1_GCCAAT_L001_R1_001.fastq.gz .
cp ~/Crangiferina/CrX1_GCCAAT_L001_R2_001.fastq.gz .


cd ../Metadata
cp /mnt/research/radishGenomics/PublicData/alladaptors.fa .
cp ~/Metadata/Crangiferina/20160714_SeqProduction_Dworkin.csv .

cd ../PublicData
## Paper 10.1186/1471-2164-13-575
# assembled transcriptome contigs
wget https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3534622/bin/1471-2164-13-575-S1.zip
unzip 1471-2164-13-575-S1.zip
# raw short reads
fastq-dump SRR446707
# raw Sanger reads GenBank:JK811361-JK813924 GenBank:GH717691-GH717859
cp ~/Crangiferina/Public/JunttilaSanger.fa .
cp ~/Crangiferina/Public/PhiX.fasta .

cd ..
qsub effective-octo-fortnight/1.1_FastQC_Lichen.qsub
