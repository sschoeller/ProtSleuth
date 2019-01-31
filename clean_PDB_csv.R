#*************************************************************************
# Programmer: Scott Schoeller (sschoellerSTEM)
# Purpose: Counts PDB Identifiers with Chain A out of a CSV file, 
# 		and creates new file with only those records
# Note: May need to replace spaces with underscores in CSV header names
# Last Revised: 31 Jan 2019
#*************************************************************************


f<-"Brugia-test.csv" # change the value of f if not tabularResults.csv 
o<-"newfile.csv" # output file

if (f == "")
  f<-"tabularResults.csv" # default Protein Data Bank CSV

csv<-read.table(file=f, header=TRUE, sep=",")

uniqueID<-csv$PDB_ID[csv$Chain_ID == "A"] # Selects Chain "A" records

num<-1 # index counter

# Prepare CSV headers
headers<-rbind("Record_ID","PDB_ID", "Chain_ID", "Macromolcular_Name", "Source", "Exp_Method", "Dep_Date", "Rel_Date", "Classification", "MW", "Author", "Residue_Count")
write.table(headers, file=o, append=FALSE, sep=",")

for (record in csv) {
  num<-num+1
  if (regexpr(csv[num,2], "A", fixed=TRUE)) { # csv$Chain_ID
	  print(csv[num,]) # typically for debugging
		dat<-(csv[num,])
	  write.table(dat, file=o, append=TRUE, sep=",")
  } # end if (regexpr...)
} # end for (record...)
