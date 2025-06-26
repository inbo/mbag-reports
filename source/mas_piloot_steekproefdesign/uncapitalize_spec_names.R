# --- Instellingen: lijst met soortnamen ---
mas_data <- read.csv("mas_data_vlaanderen_2018_2024.csv")
soortenlijst <- stringr::str_to_sentence(unique(mas_data$vernacularName))

# --- Hulpfunctie om eerste letter te kapitaliseren ---
capitalize_first <- function(x) {
  paste0(toupper(substr(x, 1, 1)), substr(x, 2, nchar(x)))
}

# --- Bestand verwerken: soortnamen verlagen + zinbegin herstellen ---
verwerk_bestand <- function(filepath, soortenlijst) {
  message("Verwerken: ", filepath)

  # Lees bestand
  text <- readLines(filepath, warn = FALSE)

  # Zet alle soortnamen naar kleine letters
  for (soort in soortenlijst) {
    text <- gsub(soort, tolower(soort), text, fixed = TRUE)
  }

  # Herstel eerste letter van elke zin (per regel)
  text <- sapply(text, function(line) {
    sentences <- unlist(strsplit(line, "(?<=[\\.\\!\\?])\\s+", perl = TRUE))

    sentences <- sapply(sentences, function(s) {
      s <- trimws(s)
      if (grepl("^[a-z]", s)) capitalize_first(s) else s
    })

    paste(sentences, collapse = " ")
  })

  # Overschrijf bestand
  writeLines(text, filepath)
}

# --- Zoek alle .Rmd bestanden in root directory ---
rmd_files <- list.files(path = ".", pattern = "\\.Rmd$", full.names = TRUE)

# --- Verwerk elk bestand ---
for (file in rmd_files) {
  verwerk_bestand(file, soortenlijst)
}
