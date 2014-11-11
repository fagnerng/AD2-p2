artists <- read.table("~/Documents/AD2/Problema 2/Dados/artists.csv", header=TRUE, quote="\"")
songs <- read.csv("~/Documents/AD2/Problema 2/Dados/songs.csv")
similarity <- read.csv("~/Documents/AD2/Problema 2/Dados/similarity.csv")
subset_tracks_per_year <- read.csv("~/Documents/AD2/Problema 2/Dados/subset_tracks_per_year.csv")
subset_artist_location <- read.csv("~/Documents/AD2/Problema 2/Dados/subset_artist_location.csv")
subset_unique_artists <- read.csv("~/Documents/AD2/Problema 2/Dados/subset_unique_artists.csv")
artist_term <- read.csv("~/Documents/AD2/Problema 2/Dados/artist_term.csv")
year_term <- read.csv("~/AD2-p2/Dados/year-term.csv")

#windows
year_term <- read.csv("C:/Users/fagnerng/git/AD2-p2/Dados/year-term.csv")
artist_term <- read.csv("C:/Users/fagnerng/git/AD2-p2/Dados/artist_term.csv")
artists <- read.table("C:/Users/fagnerng/git/AD2-p2/Dados/artists.csv", header=TRUE, quote="\"")
similarity <- read.csv("C:/Users/fagnerng/git/AD2-p2/Dados/similarity.csv")
songs <- read.csv("C:/Users/fagnerng/git/AD2-p2/Dados/songs.csv")
subset_artist_location <- read.csv("C:/Users/fagnerng/git/AD2-p2/Dados/subset_artist_location.csv")
subset_tracks_per_year <- read.csv("C:/Users/fagnerng/git/AD2-p2/Dados/subset_tracks_per_year.csv")
subset_unique_artists <- read.csv("C:/Users/fagnerng/git/AD2-p2/Dados/subset_unique_artists.csv")


songs <- merge(songs, artist_term, "artist_id")
songs <- subset(songs, songs$term == "rock" | songs$term == "indie" | songs$term == "pop" | songs$term == "jazz" | songs$term == "hip hop")
songs <- subset(songs, songs$artist_familiarity > 0 )
songs <- subset(songs, songs$artist_hotttnesss > 0 )
songs <- subset(songs, songs$release == "Live" | songs$release == "Original Album Classics" | songs$release == "The Best Of" | songs$release == "The Very Best Of" | songs$release == "Gold" | songs$release == "Greatest Hits")
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
songs$year <- NULL

#///////////////////////////////Questao 1//////////////////////////////////////////////
# 1 - é possivel acompanhar o crescimento do generos ou da musica em si!?
# R- em busca de tentar acompanha a evoluçao dos generos musicais( mais listados), 
# é possivel notar que entre 1920 e 1950 musica nao era algo ta produtivo, talvez
# pelo fato de radio nao ser tao popular, ou ate mesmo perido de guerra / crise.
# porem, apos esse  periodo a musica comessa a se popularizar, entrando na era Disco
# Epoca em que era comum sair para se divertir a noite e escultar alguma musica de seu 
# interesse.
# Com a revolucao digital, surgimento do CD, o ramo musical começa a decolar,
# onde apresenta uma crescimento jamais visto.

install.packages("ggplot2")
library("ggplot2")
p <- ggplot() 
p <- p +  geom_line(data = year_term, aes(x = year.term, y = rock, color = "Rock")) 
p <- p + geom_line(data = year_term, aes(x = year.term, y = pop, color = "Pop")) 
p <- p + geom_line(data = year_term, aes(x = year.term, y = indie, color = "Indie")) 
p <- p + geom_line(data = year_term, aes(x = year.term, y = jazz, color = "Jazz")) 
p <- p + geom_line(data = year_term, aes(x = year.term, y = hiphop, color = "Hip Hop")) 
p <- p + xlab('Years') 
p <- p + ylab('Count')
p <- p + labs(color="TAGS")
p <- p + scale_y_log10()
p <- p + geom_bar() 
p <- p + geom_text()
p <- p + scale_x_continuous(breaks=c(1920,1930,1940,1950,1960,1970,1980,1990,2000,2010))
p <- p + scale_y_continuous(breaks=c(0,20,40,60,80,100,120,140,160,180,200,220,240))
p

p2 <- ggplot(songs, aes(factor(songs$release), songs$artist_familiarity))
p2 <- p2 + geom_boxplot(aes(fill = factor(songs$release))) + geom_jitter()
p2

p3 <- ggplot(songs, aes(factor(songs$release), songs$artist_hotttnesss))
p3 <- p3 + geom_boxplot(aes(fill = factor(songs$release))) + geom_jitter()
p3
help(ggplot)
summary(songs)
