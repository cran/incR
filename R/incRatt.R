#' @title Calculation of the percentage of daily time spent in nest
#' @description This function calculates percentage of day time spent inside nest
#' based on the "inc.vector" variable produced by \code{\link{incRscan}} (or any other method).
#' Current version do not discriminate day and night times.
#' @param data data frame containing a time-series vector of 1's and 0's, where "1"
#' means "incubating individual inside nest" and "0" means "incubating individual
#' outside nest". This vector, 
#' under the name of "inc.vector" is provided by \code{\link{incRscan}} in the 
#' first object of the returned list. A column named "date" is needed to refer to daily
#' calculations.
#' @param vector.incubation name of the column (vector class) storing the
#' information about the presence/absence of the incubating individual in the nest.
#' @details The 'date' column must have a 'year-month-day' format for this function to run correctly.
#' @return Daily percentage of time in nest, returned in a 
#' data frame with one day per raw.
#' @examples
#' #' # loading example data
#' data(incR_procdata)
#' incRatt (data=incR_procdata, 
#'                vector.incubation="incR_score")
#' @seealso \code{\link{incRprep}} \code{\link{incRscan}} \code{\link{incRact}}
#' @export 

incRatt<- function (data, vector.incubation) {
  ##### CHECKING FOR COLUMN NAMES #####
  if (base::is.null (data$date)){
    stop("No column for date named 'date'")
  }
  
  # correct date format
  data[["date"]] <- lubridate::ymd(data[["date"]]) 
  
  # split data set by day
  data.time <- base::split (data, data$date)
  # data frame to fill later
  day.latency <- base::data.frame (date=rep(NA, length(data.time)))
  
  # loop to assess each day
  for (d in 1:base::length(data.time)) {
    day.latency$date[d] <- base::as.character(base::unique(data.time[[d]]$date)) #date
    day.in <- base::sum(data.time[[d]][[vector.incubation]])                 # number of point inc.ind was in
    seg.day <- base::length(data.time[[d]][[vector.incubation]])             # total length of the inc.vector
    day.latency$percentage_in[d] <- (day.in/seg.day) * 100                       # ratio
  }
  return (day.latency)
}
