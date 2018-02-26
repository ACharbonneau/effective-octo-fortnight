# effective-octo-fortnight

Assembly scripts for Cladonia rangiferina Genome Project Edit

tldr:

 1. Make a directory and cd into it
  > mkdir crang && cd crang

 2. git clone this repo
  > git clone https://github.com/ACharbonneau/effective-octo-fortnight.git

 3. run setup script from main directory
  > bash effective-octo-fortnight/1_Setup.sh

## Steps

### 1_Setup

Gets raw reads, makes directory structure, and gets some public data: PhiX genome
and previously released *C. rangiferina* data.
Then starts FastQC

### 1.1_FastQC_Lichen

Does a quality check on all the raw RawReads, starts the trimming scripts

### 1.2_Trim_Lichen

Uses Trimmomatic to remove any adaptor sequence. Starts PhiX mapper.

### 1.3_BT2_PhiX

Use Bowtie2 to map the trimmed reads to PhiX. Here, I'm keeping reads that *don't*
map, and using them for subsequent steps. This gets rid of any contamination from
the sequencing spike.

### 2_Abyss_Lichen

Use Abyss to run a number of potential K values to see what would be a good K
for the real assembly.
