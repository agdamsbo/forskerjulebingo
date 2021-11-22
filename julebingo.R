## https://github.com/jennybc/bingo
library(bingo)

# Original export format is madness.. but after a bit of cleaning it works
library(readxl)
playlist<-read_xlsx("/Users/au301842/Desktop/Julesangsbingo/julesangsmadnes_clean.xlsx")

## Playlist:
## https://open.spotify.com/playlist/62eKu57NMLbFadtTWccOsc?si=10f1413590934ec9

for (i in 1:nrow(playlist)){
  playlist$name[i]<-unlist(strsplit(playlist$`Track Name`[i],"[-()]"))[1]
}

bc <- bingo(n_cards = 70, words = playlist$name,n=5)
bc[trunc(nrow(bc)/2)+1,]<-"*<|:-)" 
# Funktionen skriver FREE i det midterste felt, rettes til ["*<|:-)"] - altså en nisse



setwd("/Users/au301842/Desktop/Julesangsbingo/Plader")

plot(bc)

