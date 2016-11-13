#' Get Brazilian state cities from IBGE
#'
#' copyryig (c) 2016, José de Jesus Filho
#' last modified Nov, 2016
#'
#'  This program is free software; you can redistribute it and/or
#     modify it under the terms of the GNU General Public License,
#     version 3, as published by the Free Software Foundation.
#
#     This program is distributed in the hope that it will be useful,
#     but without any warranty; without even the implied warranty of
#     merchantability or fitness for a particular purpose.  See the GNU
#     General Public License, version 3, for more details.
#
#     A copy of the GNU General Public License, version 3, is available
#     at http://www.r-project.org/Licenses/GPL-3
#'
#'  This function returns all cities of a Brazilian state according
#'      to the Brazilian Institute of Geography. You can write in
#'      either upper or lower case.
#'
#' @param
#' abb abbreviation of the state
#'
#'
#' @keywords states cities municipalities
#' @export
#' @examples
#' sergipe<-citiesBR("se")
#' amapa<-citiesBR("AP")


citiesBR<-function(abb){
  library(httr)
  library(XML)
  library(rvest)
sigla<-c("AC","AL","AM","AP","BA","CE","DF","ES","GO","MA","MG","MS","MT","PA","PB","PE","PI","PR","RJ","RN","RO","RR","RS","SC","SE","SP","TO")
codigo_estado<-c(12, 27, 13, 16, 29, 23, 53, 32, 52, 21, 31, 50, 51, 15, 25, 26, 22, 41, 33, 24, 11, 14, 43, 42, 28, 35, 17)
estado<-codigo_estado[sigla==toupper(abb)]
s<-GET("http://www.cidades.ibge.gov.br/xtras/uf.php",
query=list(lang="",coduf=estado))
s<-content(s,"parsed")
s<-html_node(s,xpath='//*[@id="lista_municipios"]')
s<-xmlParse(s)
s<-xpathSApply(s,"//*[@href]", xmlValue)
return(s)
}

