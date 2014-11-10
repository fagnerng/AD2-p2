artists <- read.table("~/Documents/AD2/Problema 2/Dados/artists.csv", header=TRUE, quote="\"")
songs <- read.csv("~/Documents/AD2/Problema 2/Dados/songs.csv")
similarity <- read.csv("~/Documents/AD2/Problema 2/Dados/similarity.csv")
subset_tracks_per_year <- read.csv("~/Documents/AD2/Problema 2/Dados/subset_tracks_per_year.csv")
subset_artist_location <- read.csv("~/Documents/AD2/Problema 2/Dados/subset_artist_location.csv")
subset_unique_artists <- read.csv("~/Documents/AD2/Problema 2/Dados/subset_unique_artists.csv")
artist_term <- read.csv("~/Documents/AD2/Problema 2/Dados/artist_term.csv")
songs <- subset(songs, songs$term == "rock" | songs$term == "indie" | songs$term == "pop" | songs$term == "jazz" | songs$term == "hip hop")
summary(songs)
songs$artist_mbid <- NULL
songs$artist_name <- NULL
songs$duration <- NULL
songs$artist_familiarity <- NULL
songs$artist_hotttnesss <- NULL
songs$artist_id <- NULL
songs$track_id <- NULL
songs$title <- NULL
songs$song_id <- NULL
songs$release <- NULL
install.packages("ggplot2")

library("ggplot2")

jazz <- ggplot(data = year.term, aes(x = year.term, y = jazz))
indie <- ggplot(data = year.term, aes(x = year.term, y = indie))
hiphop <- ggplot(data = year.term, aes(x = year.term, y = rock))

a

test <- qplot(year.term$, data = year.term, geom = "density")
test



library("ggplot2")
year_term <- read.csv("~/AD2-p2/Dados/year-term.csv")
p <- ggplot() 
p <- p +  geom_line(data = year_term, aes(x = year.term, y = rock, color = "Rock")) 
p <- p + geom_line(data = year_term, aes(x = year.term, y = pop, color = "Pop")) 
p <- p + geom_line(data = year_term, aes(x = year.term, y = indie, color = "Indie")) 
p <- p + geom_line(data = year_term, aes(x = year.term, y = jazz, color = "Jazz")) 
p <- p + geom_line(data = year_term, aes(x = year.term, y = hiphop, color = "Hip Hop")) 
p <- p + xlab('Years') 
p <- p + ylab('Count')
p <- p + labs(color="TAGS")
p
