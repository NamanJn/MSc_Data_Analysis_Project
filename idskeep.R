
dat.raw = read.table("ids.keep.dat")
famids = read.table("white_and_2mixed/famids.txt")

datC = as.character(dat.raw[,1])[1:227]
famidsC = as.character(famids[,1])

ba = paste( famidsC, "A", sep="" )
matched = match( ba, datC )

# number of matches is sotred in the "num_of_matches" variable
num_of_matches = length(which(!is.na(matched))) 

