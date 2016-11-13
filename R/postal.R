
#' Find addresses based on the Brazilian postal code numbers
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
#' This function returns a data.frame with six columns: cep (postal code),
#'      tipoDeLogradouro (type of address), logradouro (address),
#'      bairro (neiborhood), cidade (city), estado (state).
#'      If you add non numeric caracteres, the function will parse it
#'      to number and pad with zeros on the left side.
#'
#' @param
#' cep the postal code

#' @keywords postal code cep address
#' @export
#' @examples
#' address1<-postal("02828-030")
#' address2<-postal(02828030)

postal<-function(cep){
  l<-list()
  for(i in seq_along(cep)){
    cep<-stringr::str_replace(cep,"\\D","")
    cep<-stringr::str_pad(cep,8,side="left",pad="0")
    cep<-as.character(cep)
    url<-paste0("http://correiosapi.apphb.com/cep/",cep)
    a<-httr::GET(url[i])
    b<-httr::content(a,as="parsed")
    l[[i]]<-b
  }
  as.data.frame(do.call("rbind",l))
}

#' End of cep.R
