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

csv<-read.table(file = f, header = TRUE, sep = ",")

# write headers
headers<-cbind("PDB_ID", "Macromolecule_Name", "Source", "Structure Title", "Exp_Method",	"Dep_Date", "Rel_Date", "Classification",	"Structure_MW", "Structure_Author", "Residue_Count")
write.table(headers, file = o, append = FALSE, sep=",", row.names = FALSE, col.names = FALSE)

# filter and write out relevant data
num<-0 # index counter
for (record in cbind(csv[,1])) { # count distinct rows only
  num<-num+1
  print(record) # for debugging
  
  test<-substr(csv[num,2], start = 1, stop = 1)
  if (test == "A") { # csv$Chain_ID
    # remove Chain ID from output
	  #print(cbind(csv[num,-2])) # typically for debugging
		dat<-cbind(csv[num,-2])
		
		# write information on a new line in the output file
	  write.table(dat, file = o, append = TRUE, sep = ",", row.names = FALSE, col.names = FALSE)
  } # end if (test...)
} # end for (record...)
