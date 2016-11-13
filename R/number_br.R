#' Convert messy Brazilian "numeric" strings to numbers
#'
#' copyryig (c) 2016, José de Jesus Filho
#'     last modified Nov, 2016
#'
#'  This program is free software; you can redistribute it and/or
#       modify it under the terms of the GNU General Public License,
#       version 3, as published by the Free Software Foundation.
#
#     This program is distributed in the hope that it will be useful,
#         but without any warranty; without even the implied warranty of
#         merchantability or fitness for a particular purpose.  See the GNU
#         General Public License, version 3, for more details.
#
#     A copy of the GNU General Public License, version 3, is available
#         at http://www.r-project.org/Licenses/GPL-3
#'
#' This function converts messy "numeric" strings such as "346.155,7   " to numbers:
#'     346155.7
#'
#' @param
#' str strings vector with messy "numeric" strings
#'
#'
#' @keywords parse numbers strings
#' @export
#' @examples
#' number_br("346.155,7      ")

#'
number_br<-function(str){

  str<-stringr::str_replace_all(str,"\\.","")
  str<-stringr::str_replace_all(str,",",".")
  str<-stringr::str_trim(str)
  num<-as.numeric(str)
  return(num)
}

#' End of number_br.R
