library(readr)

news1 <- read_csv("https://www.dropbox.com/s/9f4xsiru2al26c0/%E5%A4%96%E9%80%81%E6%96%B0%E8%81%9E%20%282%29%20-%20%E5%B7%A5%E4%BD%9C%E8%A1%A81.csv?dl=1",
  col_names = FALSE)

news2 <- read_csv("https://www.dropbox.com/s/bp27iqfz2ei8psp/%E5%A4%96%E9%80%81%E6%96%B0%E8%81%9E%20%281%29%20-%20%E5%B7%A5%E4%BD%9C%E8%A1%A81.csv?dl=1",
  col_names = FALSE)


news3 <- read_csv("https://www.dropbox.com/s/9f4xsiru2al26c0/%E5%A4%96%E9%80%81%E6%96%B0%E8%81%9E%20%282%29%20-%20%E5%B7%A5%E4%BD%9C%E8%A1%A81.csv?dl=1",
  col_names = FALSE)

news4 <- read_csv("https://www.dropbox.com/s/7vh72qwbhr05dx8/%E5%A4%96%E9%80%81%E6%96%B0%E8%81%9E%20%283%29%20-%20%E5%B7%A5%E4%BD%9C%E8%A1%A81.csv?dl=1",
  col_names = FALSE)

news5 <- read_csv("https://www.dropbox.com/s/tmiwb7583f1bofd/%E5%A4%96%E9%80%81%E6%96%B0%E8%81%9E%20%284%29%20-%20%E5%B7%A5%E4%BD%9C%E8%A1%A81.csv?dl=1",
  col_names = FALSE)

news6 <- read_csv("https://www.dropbox.com/s/3qjb90pwaodfqaw/%E5%A4%96%E9%80%81%E6%96%B0%E8%81%9E%20%285%29%20-%20%E5%B7%A5%E4%BD%9C%E8%A1%A81.csv?dl=1",
  col_names = FALSE)

#Combine severl data in the dataframe

news <- rbind(news1,news2,news3,news4,news5,news6)
colnames(news) <- c("time","title","website_link","content","from","RSS_link")

#convert "time" to Date class
news$time <- lubridate::mdy_hm(news$time)
news$time <- lubridate::as_date(news$time)

# 新聞來源 <- data.frame(來源=c("奇摩","聯合報") , 關鍵字=c("yahoo","udn"))
# 可能可以利用title或是website_link去找出處

新聞來源 <- c()
網址 <- c()

for (.x in 1:nrow(news)){
  .x=1
  target=news[.x,]
  website = target$website_link
  stringr::str_extract(
    website,
    "(?<=https://)[\u4E00-\u9FFF]+(?=/)"
  )
}

head(news$website_link) |>
  stringr::str_extract("(?<=https://)[^/]+(?=/)")
