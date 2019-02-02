#*************************************************************************
# Programmer: Scott Schoeller (sschoellerSTEM)
# Purpose: Counts PDB Identifiers with Chain A out of a CSV file
# Note: May need to replace spaces with underscores in CSV header names
# Year: 2019
#*************************************************************************


f<-"" # change the value of f if not tabularResults.csv 

if (f == "")
  f<-"tabularResults.csv" # default Protein Data Bank CSV

csv<-read.table(file=f, header=TRUE, sep=",")

uniqueID<-csv[,1][csv[,2] == "A"] # Selects Chain "A" records

#print(uniqueID) # typically for debugging

num<-0 # counter

for (item in uniqueID) {
	#print(item) # typically for debugging
	num<-num+1
}

print(num)
