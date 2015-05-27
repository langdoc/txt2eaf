# Textfiles to ELAN processing instructions

This is a script that converts simply formatted text files into ELAN XML files. It has a few small demands for your text file structure and also gives as output the ELAN structure used in Saami Research Group in Saami Studies. For different output the sjd-xml2eaf.xsl file has to be modified. This is relatively simple, just don't touch to the technical things. It is offshoot from earlier converter that was done for Kildin Saami. This is more experimental version that probably does not work always as expected if at all.

However, if it works, then it should be pretty well compatible with R package 'FRelan' which parses and manipulates ELAN files. So the files converted with this toolset are basically ready to be input for 'FRelan' parsing.

## Setup

To get started just write to Terminal:

    git clone https://github.com/nikopartanen/txt2eaf

At first you have to install R on your computer and run these lines at Terminal (or in RStudio, or in R GUI, whatever you like):

    R
    install.packages("plyr")
    install.packages("dplyr")
    install.packages("XML")

This installs the packages required for the script to run. It has to be done only once. Whenever the script is executed it calls these packages through library() command.

You have to have the following folder structure:

    |-saxon9he.jar
    |-txt2eaf
      |-README.txt
      |-xml2eaf.xsl
      |-txt2eaf.R
        |-eaf
        |-temp
        |-txt

Saxon XSLT and XQuery Processor Home Edition can be downloaded from [here](http://sourceforge.net/projects/saxon/files/Saxon-HE/9.6/). It has been published as open source so in principle it could be added here as well, but I need to check the exact licence first and see what has to be included with it.

Your text files have to be formatted so that each line contains a sentence and translation separated by tab. They have to be in folder **txt**. Folder **temp** contains temporary XML files that are created for XSL file. Folder **eaf** contains final output.

    This is a sentence. Тайӧ сёрникузя.
    And so is this.     Тайӧ жӧ.
    Our number is irrelevant for this.  Миянӧс позьӧ унаӧн лоны.
    



The script converts the text files into a simple XML structure, file for file:



Then these are turned to ELAN files through XSL. Now here is the weakest part of this script. It is a bit difficult to generate all annotation ID's in a ideal way, which would of course be something identical to ELAN's way of doing it. Anyway, for now the annotation ID's on the Russian translations do not start from where they should, which is immediately after the last orthography ID. Now they roll the same numbers as orthography tier + 100 000. This works, as ELAN requires unique ID's, but they don't need to be consecutive.

Your file names should be formatted in a way that you want to have on your reference tier in the ELAN files. Usually this would correspond, as an example, to the session name. If you convert file called *example.txt*, then the content of reference tier will be:

    "example-1", "example-2", "example-3" and so on.

## Use

Go in Terminal to the folder **sjd2eaf** and write:

    Rscript sjd2eaf.R

This runs the script sjd2eaf.R. What should happen is that your **temp** folder gets filled with XML files and **eaf** folder gets filled with ELAN files. Each annotation has the lenght of ten seconds and the file will have automatically the lenght of 5 minutes if the annotations are not enough to fill it up to that. Also my idea was that the folder **temp** would simply be deleted in the end of the script, but for now I've just left it there as it is.

Possibly there could be a third folder called **raw**, from which another script would clean files to **txt**. That could be outside the GitHub structures if the content is sensitive. Of course also the script output can be directly forwarded to some other folders if that is desired.

## Copyright

CC BY 4.0
Freiburg Research Group in Saami Studies / Niko Partanen 2014

## Contact

Please let us know if you have some improvements to this code!

nikotapiopartanen@gmail.com
