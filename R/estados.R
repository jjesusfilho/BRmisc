#' Return a dataframe with Brazilian states' names, their abbreviation and their capitals 
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
#' This is a simple function that return a dataframe with the names of the Brazilian states,
#'     their abbreviations and their capitals.
#'      
#' @param 
#' ...
#' 
#' 
#' @keywords Brazilian states abbreviations
#' @export
#' @examples
#' df<-estados()
#' 

estados<-function(x){
  
  siglas<-c("AC","AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE","PI","RJ","RN","RS","RO","RR","SC","SP","SE","TO")
  
  estados<-c("Acre","Alagoas","Amapá","Amazonas","Bahia","Ceara","Distrito Federal",
             "Espírito Santo","Goiás","Maranhão","Mato Grosso","Mato Grosso do Sul",
              "Minas Gerais","Pará","Paraíba","Paraná","Pernambuco","Piauí","Rio de Janeiro",
              "Rio Grande do Norte","Rio Grande do Sul","Rondônia","Roraima","Santa Catarina",
              "São Paulo","Sergipe","Tocantins")
  
  capitais<-c("Rio Branco","Maceió","Macapá","Manaus","Salvador",
              "Fortaleza","Brasília","Vitória","Goiânia","São Luiz",
              "Cuiabá","Campo Grande","Belo Horizonte","Belém",
              "João Pessoa","Curitiba","Recife","Terezina","Rio de Janeiro",
              "Natal","Porto Alegre","Porto Velho","Boa Vista","Florianópolis",
              "São Paulo","Aracajú","Palmas")
 
   df<-data.frame(sigla=siglas,estado=estados,capital=capitais,stringsAsFactors = F)
  
  return(df)
  
}

#' End of estados.R