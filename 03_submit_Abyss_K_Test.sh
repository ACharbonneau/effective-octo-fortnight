mkdir k{51..63}
qsub -N ecoli -pe openmpi 8 -t 51-63:2 \
    <<<'abyss-pe -C k$SGE_TASK_ID in='Cr_P_1.fastq  Cr_P_2.fastq' se='Cr_U_1.fastq  Cr_U_2.fastq'