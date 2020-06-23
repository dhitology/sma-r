# Install Library
install.packages(c("readr", "tm", "wordcloud", "RColorBrewer"))

# Import Library
library(readr)
library(tm)
library(wordcloud)
library(RColorBrewer)

# Import Data
df <- read_csv("data/processed/clean-tweet.csv")


# Create Corpus
corpus <- Corpus(VectorSource(df$text))
corpus <- tm_map(
  corpus,
  removeWords,
  c("dan", "kenapa")
)

# Create Document Term Matrix
DTM <- TermDocumentMatrix(corpus,
  control = list(weighting = weightTfIdf)
)


# Create matrix as Dataframe
dat <- data.frame(
  word = names(f),
  freq = f
)

# Wordcloud Visualization
wc <- wordcloud(
  words = dat$word,
  freq = dat$freq,
  random.order = FALSE,
  rot.per = 0.30,
  colors = brewer.pal(8, "Dark2")
)
