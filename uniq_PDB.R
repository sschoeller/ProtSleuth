# Programmer: Scott Schoeller (sschoellerSTEM)
# Purpose: Counts PDB Identifiers with Chain A out of a CSV file
# Note: May need to replace spaces with underscores in CSV header names
# Dates: 26 Jan 2019, 27 Jan 2019

f<-readline("Enter a CSV file: ")
if (f == "") 
	f<-"tabularResults.csv" # default Protein Data Bank CSV
 
csv<-read.table(file=f, header=TRUE, sep=",")

uniqueID<-csv$PDB_ID[csv$Chain_ID == "A"]

num<-0 # counter

for (item in uniqueID) {
	print(item)
	num<-num+1
}

print(num)


