#' Downloads state budgets
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
#'  This function downloads state budgets from 2000 to 2012.
#'
#' @param
#' year year of the budget
#' abb  abbreviation of the state in either lower ou upper case.
#'
#' @keywords budget states
#' @export
#' @examples
#' budget_sp_2000<-annual_budget(2000,"sp")







annual_budget<- function(year,abb){

  ## Usei somente o pacote httr:


  httr::set_config( httr::config( ssl_verifypeer = FALSE ))


  ## estas são as possíveis siglas, mas não importa se a pessoa escreveu em maiúsculo ou minúsculo, pois usei toupper abaixo.

  sigla<-c("AC","AL","AM","AP","BA","CE","DF","ES","GO","MA","MG","MS","MT","PA","PB","PE","PI","PR","RJ","RN","RO","RR","RS","SC","SE","SP","TO")

  ##  Esses são os códigos dos estados, que realmente serão usados pelo body:

  codigo_estado<-c(12, 27, 13, 16, 29, 23, 53, 32, 52, 21, 31, 50, 51, 15, 25, 26, 22, 41, 33, 24, 11, 14, 43, 42, 28, 35, 17)

  ## converte a sigla em código do estado:

  estado<-codigo_estado[sigla==toupper(abb)]

  a<-httr::POST("https://www.contaspublicas.caixa.gov.br/sistncon_internet/consultaDeclaracoes.do",
                body=list(
                  acao="pesquisar",
                  pagina=0,
                  numeroDeclaracao=0,
                  numeroItensPagina=100,
                  esfera=0,
                  codEstado=estado,
                  codTipoPoder=1,
                  codTipoOrgao=7,
                  anoBase=year,
                  codigosPeriodo="01*003"
                ),
                encode='form'
  )

  ### Optei por usar pipe aqui para facilitar a leitura
  b<- XML::htmlParse(a)
  b<- XML::getNodeSet(b,"//*[@name='numDeclaracao']")
  b<- XML::xmlGetAttr(b[[1]],"value")
  b<-stringr::str_extract(b,"\\d+")
  b<-as.numeric(b)
  b<- paste0("https://www.contaspublicas.caixa.gov.br/sistncon_internet/consultaDeclaracoes.do?acao=imprimir&numeroDeclaracao=",b)
  httr::GET(b,httr::write_disk(paste0(abb,year,".pdf"),overwrite=TRUE))
}
