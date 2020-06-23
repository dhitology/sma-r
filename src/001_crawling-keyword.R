# Install Library
install.packages("rtweet")

# Impport Library
library("rtweet")

# Set Keyword, Number of Tweet, and Language that you looking for.
keyword <- "Jersey"
jumlahtweet <- 1000
bahasa <- "id"

# If you want to get retweet, set as TRUE
retweet <- TRUE

# Auth.
token <- create_token(
  app = "Thesis Dito",
  consumer_key = "XIjOsMfdVdRTVinmuHYCteIMH",
  consumer_secret = "EJTA5VDwjNLPgkoUpDj1DVb7lxHeEa4KFt2J79RGmijDoPHuqd",
  access_token = "984196360864870400-EjeUGXKfHjK6M0Zyy2NRCi5oA2x0EsY",
  access_secret = "Txdk4sysP8bpkv8Q8H6aSQNuSvW4df9YmWAhAD5AAD0WG",
  set_renv = TRUE
)

# Collecting Tweet
crawling <- search_tweets(keyword,
  n = jumlahtweet,
  include_rts = retweet,
  type = "recent",
  lang = bahasa,
  retryonratelimit = FALSE
)

# Get User Information
user_data <- users_data(crawling)

# Save full crawling result as .csv file
write_as_csv(crawling,
  "data/raw/hasilcrawling-keyword.csv",
  prepend_ids = TRUE,
  na = "",
  fileEncoding = "UTF-8"
)

# Save user information data as .csv file
write_as_csv(user_data,
  "data/raw/user-data.csv",
  prepend_ids = TRUE,
  na = "",
  fileEncoding = "UTF-8"
)
