# Install Library
install.packages("rtweet")

# Import Library
library(rtweet)

# Set the account name, Ex. "jokowi"
akun <- "dhitology"
jumlahtweet <- 1000
ambilretweet <- FALSE

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
timeline <- get_timelines(akun,
  n = jumlahtweet,
  home = ambilretweet
)

# Save Sebagai CSV
write_as_csv(crawling,
  "data/raw/hasilcrawling-timeline.csv",
  prepend_ids = TRUE,
  na = "",
  fileEncoding = "UTF-8"
)