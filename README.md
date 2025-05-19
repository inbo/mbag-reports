<!-- spell-check: ignore:start -->
<!-- badges: start -->
![GitHub](https://img.shields.io/github/license/inbo/mbag-reports)
![GitHub repo size](https://img.shields.io/github/repo-size/inbo/mbag-reports)
<!-- badges: end -->

# Rapporten MBAG project

[Langeraert, Ward![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0002-5900-8109)[^aut][^cre][^inbo.be]
[Cartuyvels, Emma![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0001-7856-6360)[^aut][^inbo.be]
[Van Calster, Hans![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0001-8595-8426)[^aut][^inbo.be]
Instituut voor Natuur- en Bosonderzoek (INBO)[^cph][^fnd]

[^cph]: copyright houder
[^fnd]: financier
[^aut]: auteur
[^cre]: contactpersoon
[^inbo.be]: Instituut voor Natuur- en Bosonderzoek (INBO)
<!-- spell-check: ignore:end -->

**keywords**: landbouw, meetnet, biodiversiteit, MBAG, rapportage

<!-- community: inbo -->

<!-- description: start -->
Dit is een repository voor het maken van de rapporten in kader van het MBAG project.
<!-- description: end -->

# Hoe bouw ik een rapport van deze repository

1.  Clone deze repo lokaal en open het R-project van jouw rapport in RStudio (onder mbag-reports > source > `naam_van_jouw_rapport_rproject`.Rproj
2.  Zorg dat je toegang hebt tot de Google Drive folder met de figuren/data die worden gebruikt voor het rapport
3.  `include_from_drive()` functie in index.Rmd\
    a. Bouw je het rapport voor de eerste keer of na een lange afwezigheid?\
       Verander in index.Rmd het argument `overwrite` van `include_from_drive()` functie naar `TRUE`: `include_from_drive(name = file_name, figures = figs, overwrite = TRUE)`
       Zo heb je zeker de meest recente figuren voor het rapport.\
    b. Indien je regelmatig opnieuw bouwt en je zeker de laatste figuren lokaal hebt staan, laat dan `overwrite = FALSE` staan
5.  Bouw het rapport als INBOmd::pdf_report
6.  Indien je in index.Rmd het argument naar `overwrite = TRUE` hebt aangepast, zet je overwrite nu terug naar `FALSE`; anders verlies je vanaf nu veel onnodige tijd bij het bouwen van het rapport omdat alle bestanden telkens opnieuw download en overschrijft.

Bijkomende problemen die kunnen opduiken:

**1.** Werken met regelnummers

Indien regelnummers worden toegevoegd, werken we met het lineno LaTeX package.
Als je deze niet hebt, kan je deze of een gelijkaardige error krijgen wanneer je je rapport bouwt:

```
LaTeX Error: File `lineno.sty' not found.
```

Deze error wordt in een .log-bestand opgeslaan.
Je kan deze package via het log-bestand installeren door deze code in je console te runnen:

```
tinytex::parse_install("`naam_van_jouw_rapport_rproject`.log")
```

Indien je hier een foutmelding krijgt, moet je misschien eerst en nieuwere versie van TinyTeX installeren (zie volgende puntje).
Daarna run je opnieuw bovenstaande code in je console.

**2.** TinyTeX updaten

Het kan voorkomen dat je een melding krijgt dat TinyTeX een nieuwere versie heeft.
Ook kan het helpen TinyTeX te updaten als het niet lukt om een package te installeren.
Dit kan door deze code in je console te runnen:

```
tinytex::reinstall_tinytex()
```

Je kan ook zelf een repository specificeren, bijvoorbeeld `tinytex::reinstall_tinytex(repository = "illinois")`.
