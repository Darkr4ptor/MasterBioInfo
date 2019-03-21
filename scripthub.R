library(dplyr)
library(tidyr)
library(tibble)

setwd("/home/santiago/Escritorio/TercerDia/");

files = dir()
files.abr = files[grepl("abr", files)]
files.vf  = files[grepl("vf", files)]

ABR = read.table(files.abr[1])

ABR$Sample = files.abr[1]

for(i in 2:60)
{
  tmp = read.table(files.abr[i])
  tmp$Sample = files.abr[i]
  ABR = bind_rows(ABR,tmp)
}
ABR$Sample = gsub(".abr", "", ABR$Sample)

VF = read.table(files.vf[1])

VF$Sample = files.vf[1]

for(i in 2:60)
{
  tmp = read.table(files.vf[i])
  tmp$Sample = files.vf[i]
  VF = bind_rows(VF,tmp)
}

VF$Sample = gsub(".vf", "", VF$Sample)

colnames(ABR) = c("qaccver", "saccver", "pident", "length", "missmatch", "gapopen", "qstart", "qend", "sstart", "send",
                  "evalue", "bitscore", "Sample")
colnames(VF) = c("qaccver", "saccver", "pident", "length", "missmatch", "gapopen", "qstart", "qend", "sstart", "send",
                  "evalue", "bitscore", "Sample")


ABR.filt = ABR %>% filter(pident > 95) %>% group_by(qaccver, qstart,Sample) %>% summarise(saccver = first(saccver), pident = first(pident),
                                                       evalue = first(evalue))

VF.filt = VF %>% filter(pident > 95) %>% group_by(qaccver, qstart,Sample) %>% summarise(saccver = first(saccver), pident = first(pident),
                                                                  evalue = first(evalue))

ABR.filt %>% 
  ungroup() %>%
  select(Sample, saccver, pident) %>% 
  group_by(Sample, saccver) %>%
  summarise(pident = first(pident)) %>%
  spread(saccver,pident,fill = 0) %>% 
  column_to_rownames("Sample") %>%
  as.matrix() %>%
  heatmap()
