# First we load the R packages which we have installed before running this script. It can be done with command:
# install.packages("plyr")
# install.packages("dplyr")
# install.packages("XML")

library(plyr)
library(dplyr)
library(XML)


# txt2eaf(path = "/Users/niko/kom/kpv_izva/kpv_izva19300000ArtijevI-136", actor = "IXA-M-18XX")

### We are reading first all text files in the directory /txt. ldply is a nice function from plyr
# package. It splits list, applies a function and returns results in a data frame. Now in the end we use
# tbl_df function from dplyr, which creates a nice local data frame. I'm not saying that this is the best
# way to read in files, it's maybe bit messy for presence of both plyr and dplyr. But it works.

txt2eaf <- function(source_path = ".", actor = "S1", source_pattern = ".csv$"){
orth <- ldply(list.files(path = source_path, pattern = source_pattern, full.names = TRUE), function(filename) {
        temp <- read.delim(filename, quote="", header=FALSE, stringsAsFactors = FALSE)
        #If you want to add the filename as well on the column
        temp$filename <- filename
        return(tbl_df(temp))
})

orth <- orth %>% rename(orthography = V1)

if("V2" %in% colnames(orth))
{
        orth <- orth %>% rename(ft_rus = V2);
}

# After this we clean up the file a bit. Basically this turns filenames into session names.

orth$filename <- gsub(".+/", "", orth$filename, perl = TRUE)
orth$filename <- gsub(source_pattern, "", orth$filename, perl = TRUE)
orth$filename
# After this the data frame is split into a list where each data frame is an object on the list.

orth <- split(orth, orth$filename)

# This is a function that creates XML files. In principle the participant ID could be in text file 
# and added in this point to the XML file.

dfToXML <- function(orth) {
        session <- newXMLNode("session")
        addAttributes(session, name = orth$filename[1])
        orthography <- lapply(seq_along(orth$orthography), function(x){newXMLNode("orthography",
                              attrs = c(ID = paste(orth$filename[1], "-", as.character(x), sep=""), PARTICIPANT="S1"),
                              .children = orth$orthography[x])
        })
        ftrus <- lapply(seq_along(orth$ft_rus), function(x){newXMLNode("ftrus",
                              attrs = c(ID = paste(orth$filename[1], "-", as.character(x), sep=""), PARTICIPANT="S1"),
                                                                                  .children = orth$ft_rus[x])
        })        
        addChildren(session, orthography, ftrus)
        saveXML(session, file=paste0("temp/", orth$filename[1], ".xml"))
}

# Now we use list-apply function to use the dataframe to XML function to each object on the list.

lapply(orth, dfToXML)

# Now we create another more simple object that just has the files we have.

files <- list.files(source_path)
files <- gsub(source_pattern, "", files, perl = TRUE)
files
# Then we can use XSLT to process the files. I have Saxon XSLT processor a couple of folders above
# my working directory, so I refer to that in the following commands.

# This batch processes all XML files in the folder /temp which we just created and filled. It's a loop that sends command to Terminal for each object in
# the object "files". I'm not sure how stressing this is for computer if there are, as an example, hundreds of files, but for now it works quite nicely.


for (i in 1:length(files)){
        system(paste0("java -jar ~/saxon9he.jar -s:temp/", files[i], ".xml -xsl:xml2eaf.xsl -o:eaf/", files[i], ".eaf", " Participant=", actor))
        system(paste0("java -jar ~/saxon9he.jar -s:temp/", files[i], ".xml -xsl:xml2pfsx.xsl -o:eaf/", files[i], ".pfsx", " Participant=", actor))
}



}

