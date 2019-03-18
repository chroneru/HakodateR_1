library(rtweet)
library(RMeCab)
library(tidyverse)
library(wordcloud)

# ---------------------- twitter ------------------------------

source("init_token.R")

create_token(
   app = app,
   consumer_key = consumer_key,
   consumer_secret = consumer_secret,
   access_token = access_token,
   access_secret = access_secret
)

query <- '"#rstats" OR "R言語" OR "r言語" OR "#tokyor" OR "#SappoRoR" OR "#HakodateR"'

tweets <- search_tweets(
    q = query,
    n = 1000,
    include_rts = FALSE,
    lang = "ja"
)

regexp <- c("[^a-zA-Z亜-熙ぁ-んァ-ヶー0-9]?(rstats)?([Tt]okyo[Rr])?([Ss]apporo[Rr])?([Hh]akodate[Rr])?")

tweets_shaped <- tweets %>%
    distinct(text) %>% 
    pull(text) %>% 
    str_remove_all(pattern = regexp) %>% 
    as.tibble()

write_csv(tweets_shaped, "./src_R/result.csv")

# -------------------------------------------------------------

# ---------------------- 形態素解析 ---------------------------

docDF_hakodate <- docDF(
    "src_R/result.csv",
    type = 1
)

docDF_hakodate_filtered <- docDF_hakodate %>%
    filter(!str_detect(.$TERM, "(http|[0-9]+)"),
           POS1 == "名詞",
           !POS2 %in% c("非自立", "サ変接続", "代名詞", "接尾"),
           map(.$TERM, str_length) != 1
    ) %>% 
    distinct(TERM, .keep_all = T)

# -------------------------------------------------------------

# ----------------------- word cloud の作成 -------------------

png(file = "wordcloud.png", width = 1280, height = 800)
wordcloud(
    docDF_hakodate_filtered$TERM,
    docDF_hakodate_filtered$result.csv,
    min.freq = 3,
    scale = c(3, 0.5),
    
    random.order = F,
    
    # fontの指定
    family = "IPAPGothic",
    colors = brewer.pal(8, "Dark2")
)
dev.off()

# -------------------------------------------------------------
