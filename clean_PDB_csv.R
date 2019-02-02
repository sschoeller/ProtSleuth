#*************************************************************************
# Programmer: Scott Schoeller (sschoellerSTEM)
# Purpose: Counts PDB Identifiers with Chain A out of a CSV file, 
# 		and creates new file with only those records
# Note: May need to replace spaces with underscores in CSV header names
# Year: 2019
#*************************************************************************


f<-"" # change the value of f if not tabularResults.csv 
o<-"newfile.csv" # output file

if (f == "")
  f<-"tabularResults.csv" # default Protein Data Bank CSV

csv<-read.table(file=f, header=TRUE, sep=",", rm.na=TRUE)

uniqueID<-csv$PDB_ID[csv$Chain_ID == "A"] # Selects Chain "A" records

num<-1 # index counter

for (record in csv) {
  num<-num+1
  if (regexpr(csv[num,2],"A{1}")) { # csv$Chain_ID
	  print(cbind(csv[num,-2])) # typically for debugging
		dat<-cbind(csv[num,])
		
		# write information on a new line in the output file
	  write.table(dat, file=o, append=TRUE, sep=",", row.names=FALSE)
  } # end if (regexpr...)
} # end for (record...)
