###Opgave 2.4

##HC Andersens Boulevard

library(httr)
library(rvest)

# Hent siden for at få CSRF-token
url <- "https://envs2.au.dk/Luftdata/Presentation/table/Copenhagen/HCAB"
res <- GET(url)
html <- content(res, as = "text")
csrf_token <- read_html(html) %>%
  html_node("input[name='__RequestVerificationToken']") %>%
  html_attr("value")

# Send POST-anmodning med CSRF-token
res_post <- POST(
  url = "https://envs2.au.dk/Luftdata/Presentation/table/MainTable/Copenhagen/HCAB",
  body = list("__RequestVerificationToken" = csrf_token),
  encode = "form"
)

# Parse og gem tabellen
hcabdata <- read_html(content(res_post, as = "text")) %>%
  html_table(fill = TRUE) %>%
  .[[1]]

write.csv(hcabdata, "HCABdata", row.names = FALSE)

##Anholt

library(httr)
library(rvest)

# Hent siden for at få CSRF-token
url <- "https://envs2.au.dk/Luftdata/Presentation/table/Rural/ANHO"
res <- GET(url)
html <- content(res, as = "text")
csrf_token <- read_html(html) %>%
  html_node("input[name='__RequestVerificationToken']") %>%
  html_attr("value")

# Send POST-anmodning med CSRF-token
res_post <- POST(
  url = "https://envs2.au.dk/Luftdata/Presentation/table/MainTable/Rural/ANHO",
  body = list("__RequestVerificationToken" = csrf_token),
  encode = "form"
)

# Parse og gem tabellen
anhodata <- read_html(content(res_post, as = "text")) %>%
  html_table(fill = TRUE) %>%
  .[[1]]

# Gem data i en CSV-fil
write.csv(anhodata, "ANHOdata", row.names = FALSE)

###Banegårdsgade

## AARH3 data

library(httr)
library(rvest)

# Hent siden for at få CSRF-token
url <- "https://envs2.au.dk/Luftdata/Presentation/table/Aarhus/AARH3"
res <- GET(url)
html <- content(res, as = "text")
csrf_token <- read_html(html) %>%
  html_node("input[name='__RequestVerificationToken']") %>%
  html_attr("value")

# Send POST-anmodning med CSRF-token
res_post <- POST(
  url = "https://envs2.au.dk/Luftdata/Presentation/table/MainTable/Aarhus/AARH3",
  body = list("__RequestVerificationToken" = csrf_token),
  encode = "form"
)

# Parse og gem tabellen
aarh3data <- read_html(content(res_post, as = "text")) %>%
  html_table(fill = TRUE) %>%
  .[[1]]

write.csv(aarh3data, "AARH_data", row.names = FALSE)

#Risø

## RISOE data

library(httr)
library(rvest)

# Hent siden for at få CSRF-token
url <- "https://envs2.au.dk/Luftdata/Presentation/table/Rural/RISOE"
res <- GET(url)
html <- content(res, as = "text")
csrf_token <- read_html(html) %>%
  html_node("input[name='__RequestVerificationToken']") %>%
  html_attr("value")

# Send POST-anmodning med CSRF-token
res_post <- POST(
  url = "https://envs2.au.dk/Luftdata/Presentation/table/MainTable/Rural/RISOE",
  body = list("__RequestVerificationToken" = csrf_token),
  encode = "form"
)

# Parse og gem tabellen
risoe_data <- read_html(content(res_post, as = "text")) %>%
  html_table(fill = TRUE) %>%
  .[[1]]

write.csv(risoe_data, "RISO_data.csv", row.names = FALSE)







