#*************************************************************************
# Programmer: Scott Schoeller (sschoellerSTEM)
# Purpose: Verifies raw data has the same number of unique PDB entries
#         as the cleaned output
# Note: May need to replace spaces with underscores in CSV header names
# Year: 2019
#*************************************************************************

f<-"" # change the value of f if not tabularResults.csv 
o<-"" # change the value of o if not newfile.csv 

if (f == "")
  f<-"tabularResults.csv" # default Protein Data Bank CSV
if (o == "")
  o<-"newfile.csv"

csv1<-read.table(file=f, header=TRUE, sep=",")
csv2<-read.table(file=o, header=TRUE, sep=",")

uniqueIn<-csv1[,1][csv1[,2] == "A"] # Selects Chain "A" records
uniqueOut<-csv2[,1] # select PDB IDs

#print(uniqueIn) # typically for debugging

# count number of PDB entries in raw data
countIn<-0 # counter
for (item in uniqueIn) {
  #print(item) # typically for debugging
  countIn<-countIn+1
}

# count number of PDB entries in filtered data
countOut<-0 # counter
for (item in uniqueOut) {
  #print(item) # typically for debugging
  countOut<-countOut+1
}

# compare
if (countIn == countOut) {
  print("ID number of records present")
} else {
  print("ERROR: The number of records are not the same")
  print("\n\r")
  print(countIn)
  print("Versus")
  print(countOut)
}
