require(readxl)
EMPRESAS_Paulista_T4 <- read_excel("EMPRESAS_Paulista T4.xlsx")

EMPRESAS_GRUPO <-
  EMPRESAS_Paulista_T4[EMPRESAS_Paulista_T4$`Gestor da Empresa` == "GUSTAVO FUNAYAMA HOTTA" |
                         EMPRESAS_Paulista_T4$`Gestor da Empresa` == "RAFAEL GUSTAVO FURLAN" |
                         EMPRESAS_Paulista_T4$`Gestor da Empresa` == "RICARDO SQUASSINA LEE", ]

require(ggmap)
register_google(key = readLines(con <- file("api.key")))
EMPRESAS_GRUPO$GEOCODE <-
  geocode(
    EMPRESAS_GRUPO$CEP,
    inject = "region=br",
    source = "google",
    output = "more",
    override_limit = TRUE,
    messaging = TRUE,
    nameType = "short"
  )

EMPRESAS_GRUPO$GEOCODE$administrative_area_level_1 <-
  gsub("state of ",
       "",
       ignore.case = TRUE,
       EMPRESAS_GRUPO$GEOCODE$administrative_area_level_1)

EMPRESAS_GRUPO$GEOCODE$administrative_area_level_1 <-
  gsub(
    "São Paulo",
    "SP",
    ignore.case = TRUE,
    EMPRESAS_GRUPO$GEOCODE$administrative_area_level_1
  )

EMPRESAS_GRUPO$GEOCODE$administrative_area_level_1 <-
  gsub(
    "Rio de Janeiro",
    "RJ",
    ignore.case = TRUE,
    EMPRESAS_GRUPO$GEOCODE$administrative_area_level_1
  )

EMPRESAS_GRUPO$GEOCODE$administrative_area_level_1 <-
  gsub(
    "rio grande do sul",
    "RS",
    ignore.case = TRUE,
    EMPRESAS_GRUPO$GEOCODE$administrative_area_level_1
  )

EMPRESAS_GRUPO$CIDADEESTADO <-
  paste(
    EMPRESAS_GRUPO$GEOCODE$administrative_area_level_2,
    "-",
    EMPRESAS_GRUPO$GEOCODE$administrative_area_level_1
  )

write.table(
  EMPRESAS_GRUPO,
  file = "EMPRESAS_GRUPO.txt",
  sep = "\t",
  fileEncoding = "UTF-8",
  row.names = FALSE,
  col.names = TRUE
)

#Questão 1

print(
  c(
    "Empresas consideradas no grupo",
    nrow(EMPRESAS_GRUPO),
    "Empresas localizadas",
    sum(!is.na(EMPRESAS_GRUPO$GEOCODE$lon)),
    "Empresas não localizadas",
    sum(is.na(EMPRESAS_GRUPO$GEOCODE$lon))
  )
)

i <- 1
while (i < nrow(EMPRESAS_GRUPO)) {
  if (is.na(EMPRESAS_GRUPO$GEOCODE$lon[i])) {
    print(c("CEP não localizado", EMPRESAS_GRUPO$CEP[i]))
  }
  i <- i + 1
}
