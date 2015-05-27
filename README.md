# txt2eaf processing instructions

This is a R function that converts simply formatted text files into ELAN XML files. It has a few small demands for your text file structure and also gives as output the ELAN structure used in Saami Research Group in Saami Studies. For different output the xml2eaf.xsl file has to be modified. This is relatively simple, it is easy to use another ELAN file as a model. It is offshoot from earlier converter that was done for Kildin Saami. This is more experimental version that probably does not work always as expected if at all. This also creates automatically .pfsx files. Again, the settings in that file reflect personal preferences of Niko Partanen, and should be customized.

This is a function instead of a simple script. It should be sourced and used in the following fashion:

    txt2eaf(path = "./path/to/txt/files", source_pattern = "txt$", actor = "S1")

It is easy to run this from another file and this way have a nice memo from the files you have processed. It takes all the files in the folder and converts those. The output is placed into eaf-folder. The idea is that this function would be ran from the top of the file structure which is here in GitHub (this is maybe not ideal, but this is how it is not set up).

This function is pretty well compatible with R package 'FRelan' which parses and manipulates ELAN files. So the files converted with this toolset are basically ready to be input for 'FRelan' parsing. Only thing lacking is the tokenization, which has to be done in ELAN.

## Setup

To get started just write to Terminal:

    git clone https://github.com/nikopartanen/txt2eaf

At first you have to install R on your computer and run these lines at Terminal (or in RStudio, or in R GUI, whatever you like):

    R
    install.packages("plyr")
    install.packages("dplyr")
    install.packages("XML")

This installs the packages required by this function. It has to be done only once. Later it takes these packages through library() command.

You have to have the following folder structure:

    |-saxon9he.jar
    |-txt2eaf
      |-README.txt
      |-xml2eaf.xsl
      |-xml2pfsx.xsl
      |-txt2eaf.R
        |-eaf
        |-temp
        |-txt

Saxon XSLT and XQuery Processor Home Edition can be downloaded from [here](http://sourceforge.net/projects/saxon/files/Saxon-HE/9.6/). It has been published as open source so in principle it could be added here as well, but I need to check the exact licence first and see what has to be included with it.

Your text files have to be formatted so that each line contains a sentence and translation separated by tab. They have to be in folder set in the first argument. Folder **temp** contains temporary XML files that are created for XSL file. Folder **eaf** contains final output.

    Original sentence.\tEnglish translation.\tRussian translation\n

Your file names should be formatted in a way that you want to have on your reference tier in the ELAN files. Usually this would correspond, as an example, to the session name. If you convert file called *example.txt*, then the content of reference tier will be:

    "example-1", "example-2", "example-3" and so on.

## Things to add

- Tokenization (this is just an XSL issue, I don't know how to write it there!)
- Output folder could also be specified in the arguments
- Larger number of tiers could be somehow speficied

## Copyright

CC BY 4.0
Freiburg Research Group in Saami Studies / Niko Partanen 2015

## Contact

Please let us know if you have some improvements to this code!

nikotapiopartanen@gmail.com
