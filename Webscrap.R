library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)

link <- "https://www.amazon.in/s?bbn=1983518031&rh=n%3A1983518031%2Cp_89%3AASIAN&dc&pf_rd_i=1983518031&pf_rd_i=1983518031&pf_rd_m=A1VBAL9TL5WCBF&pf_rd_m=A1VBAL9TL5WCBF&pf_rd_p=0a2cc271-509d-4e6c-a55b-f2a271405749&pf_rd_p=746b5220-af65-4549-b395-03eb3bd4f8e6&pf_rd_r=42N774ZYRCP2V6CV7EXG&pf_rd_r=HCWGHCYG4V99QN6YJZBM&pf_rd_s=merchandised-search-6&pf_rd_s=merchandised-search-6&qid=1686778490&rnid=3837712031&ref=lp_1983518031_nr_p_89_2"
path = paths_allowed(link)

web<-read_html(link)

ShoeName<-web%>%html_nodes(".a-color-base.a-text-normal")%>%html_text()
View(ShoeName)

ratings<-web%>%html_nodes(".s-link-style .s-underline-text")%>%html_text()
View(ratings)

Price<-web%>%html_nodes(".a-price-whole")%>%html_text()
View(Price)


watchDetails<-data.frame(ShoeName,ratings,Price)
View(CameraDetails)

write.csv(ShoeDetails, "shoelist.csv")
