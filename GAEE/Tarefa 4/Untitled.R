data(oldcol)
col.W <- nb2listw(COL.nb, style="W")
crime <- COL.OLD$CRIME
str(moran(crime, col.W, length(COL.nb), Szero(col.W)))
is.na(crime) <- sample(1:length(crime), 10)
str(moran(crime, col.W, length(COL.nb), Szero(col.W), NAOK=TRUE))


data(World, rivers, metro)

# just the map
qtm(World)

# choropleth
qtm(World, fill = "economy", format = "World", style = "col_blind")

# choropleth with more specifications
qtm(World, fill="HPI", fill.n = 9, fill.palette = "div",
    fill.title = "Happy Planet Index", fill.id = "name", 
    style = "gray", format = "World")
# this map can also be created with the main plotting method,
# which is recommended in this case.
## Not run: 
tm_shape(World) +
  tm_polygons("HPI", n = 9, palette = "div",
              title = "Happy Planet Index", id = "name") +
  tm_style("gray") +
  tm_format("World")

## End(Not run)

# bubble map
## Not run: 
qtm(World, borders = NULL) + 
  qtm(metro, symbols.size = "pop2010", 
      symbols.title.size= "Metropolitan Areas", 
      symbols.id= "name",
      format = "World")

## End(Not run)

# TIP: check out these examples in view mode, enabled with tmap_mode("view")

## Not run: 
# without arguments, a plain interactive map is shown (the mode is set to view)
qtm()

# search query for OpenStreetMap nominatim
qtm("Amsterdam")

## End(Not run)

## Not run: 
data(NLD_prov)

m1 <- tm_shape(NLD_prov) + 
  tm_polygons("yellow") +
  tm_facets(along = "name")

tmap_animation(m1, filename="Dutch_provinces.gif", width=800, delay=40)

data(World, metro)

m2 <- tm_shape(World, simplify = 0.5) +
  tm_fill() +
  tm_shape(metro) + 
  tm_bubbles(size = paste0("pop", seq(1970, 2030, by=10)),
             col = "purple",
             border.col = "black", border.alpha = .5,
             scale = 2) +
  tm_facets(free.scales.symbol.size = FALSE, nrow=1,ncol=1) + 
  tm_format("World", scale=.5)

tmap_animation(m2, filename="World population.gif", width=1200, delay=100)

## End(Not run)
