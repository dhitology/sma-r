# Install Library
install.packages("rtweet")

# Import Library
library(rtweet)

# Set Keyword that you looking for.
keyword <- "jersey"

# Auth.
token <- create_token(
  app = "Thesis Dito",
  consumer_key = "XIjOsMfdVdRTVinmuHYCteIMH",
  consumer_secret = "EJTA5VDwjNLPgkoUpDj1DVb7lxHeEa4KFt2J79RGmijDoPHuqd",
  access_token = "984196360864870400-EjeUGXKfHjK6M0Zyy2NRCi5oA2x0EsY",
  access_secret = "Txdk4sysP8bpkv8Q8H6aSQNuSvW4df9YmWAhAD5AAD0WG",
  set_renv = TRUE
)

# Streaming for 1 Week
stream_tweets(Keyword,
  timeout = 60 * 60 * 24 * 7,
  file_name = "crawling.json",
  parse = FALSE
)

# Parsing the streaming result
streaming <- parse_stream("crawling.json")

# Save as .CSV
write_as_csv(streaming,
  "data/raw/hasilstreaming.csv",
  prepend_ids = TRUE,
  na = "",
  fileEncoding = "UTF-8"
)