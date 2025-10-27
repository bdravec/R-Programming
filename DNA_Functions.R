# Function to calculate GC-content of a DNA sequence, that is the percentage 
# of nitrogenous bases in a DNA or RNA molecule that are either 
# guanine (G) or cytosine (C).
# 
# input: a DNA-sequence in a single string
# output: Percentage of the GC-content
# 
GC_content <- function(sequence) {
  # split sequence into it single letters 
  bases <- strsplit(sequence, "")[[1]] # [[1]] because the output is a list 
  # count how many letters are either G and C
  count <- sum(bases %in% c("G", "C"))
  # Calculate percentage
  percentage <- (count / length(bases)) * 100
  return(percentage)
}


# Function to transcribe DNA to RNA
# In RNA, uracil (U) is used instead of thymine (T). 
# So every T is replaced by U. 
# 
# input: a DNA-sequence in a single string
# output: corresponding RNA sequence# 
# 
DNA_to_RNA <- function(sequence) {
  # Replace T with U
  rna <- gsub("T", "U", sequence)
  return(rna)
}