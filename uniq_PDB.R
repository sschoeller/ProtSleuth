#*************************************************************************
# Programmer: Scott Schoeller (sschoellerSTEM)
# Purpose: Counts PDB Identifiers with Chain A out of a CSV file
# Note: May need to replace spaces with underscores in CSV header names
# Last Revised: 31 Jan 2019
#*************************************************************************


f<-"" # change the value of f if not tabularResults.csv 

if (f == "")
  f<-"tabularResults.csv" # default Protein Data Bank CSV

csv<-read.table(file=f, header=TRUE, sep=",")

uniqueID<-csv$PDB_ID[csv$Chain_ID == "A"] # Selects Chain "A" records

num<-0 # counter

for (item in uniqueID) {
	#print(item) # typically for debugging
	num<-num+1
}

print(num)


