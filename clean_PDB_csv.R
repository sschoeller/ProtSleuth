#*************************************************************************
# Programmer: Scott Schoeller (sschoellerSTEM)
# Purpose: Counts PDB Identifiers with Chain A out of a CSV file, 
# 		and creates new file with only those records
# Note: May need to replace spaces with underscores in CSV header names
# Creation Date: 28 Jan 2018
#*************************************************************************


f<-"" # change the value of f if not tabularResults.csv 
o<-"newfile.csv" # output file

if (f == "")
  f<-"tabularResults.csv" # default Protein Data Bank CSV

csv<-read.table(file=f, header=TRUE, sep=",")

uniqueID<-csv$PDB_ID[csv$Chain_ID == "A"] # Selects Chain "A" records

num<-0 # counter

# Prepare CSV headers
headers<-csv[1,]
write.table(headers, file=o, append=FALSE, sep=",")


for (record in csv) {
	print(record) # typically for debugging
	if (record$Chain_ID == "A") { # FIX
		dat<-cbind(record)
		write.table(dat, file="newfile.csv", append=TRUE, sep=",")
	}
}
