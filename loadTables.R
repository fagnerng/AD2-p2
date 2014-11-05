artists <- read.table("~/Documents/AD2/Problema 2/Dados/artists.csv", header=TRUE, quote="\"")
songs <- read.csv("~/Documents/AD2/Problema 2/Dados/songs.csv")
similarity <- read.csv("~/Documents/AD2/Problema 2/Dados/similarity.csv")
subset_tracks_per_year <- read.csv("~/Documents/AD2/Problema 2/Dados/subset_tracks_per_year.csv", header=FALSE)
subset_artist_location <- read.csv("~/Documents/AD2/Problema 2/Dados/subset_artist_location.csv", header=FALSE)
subset_unique_artists <- read.csv("~/Documents/AD2/Problema 2/Dados/subset_unique_artists.csv", header=FALSE)
song_with_years <- subset(songs, songs$year > 0)
song_with_years < song_with_years[order(song_with_years$year) , ]