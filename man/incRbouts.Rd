% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/incRbouts.R
\name{incRbouts}
\alias{incRbouts}
\title{Calculation of the number of daily on- and off-bouts}
\usage{
incRbouts(data, vector.incubation, dec_time, temp, sampling.rate)
}
\arguments{
\item{data}{data frame containing a time-series vector of 1's and 0's, where "1"
means "incubating individual inside nest" and "0" means "incubating individual
outside nest". This vector, 
under the name of "inc.vector", is provided by \code{\link{incRscan}} in the 
first object of the returned list. A column named "date" is needed to refer to daily
calculations.}

\item{vector.incubation}{name of the column (vector class) storing the
information about the presence/absence of the incubating individual in the nest.}

\item{dec_time}{(character class) name of the column with decimal time.}

\item{temp}{(character class) name of the column with incubation temperatures.}

\item{sampling.rate}{time difference between two consecutive recording points.
Effectively, the rate at which data points were recorded 
(e.g. 1 data point per 50sec).
The time units of the returned object will depend on the units of this argument.}
}
\value{
This function returns a list with two objects. The first object, named \code{total_bouts}, is a list of 
individual on- and off-bouts, giving information about their start time, duration, start nest temperature and 
final nest temperature. The second object, \code{day_bouts}, provides a summary of on- 
and off-bouts per day of observation. This second table shows number and mean duration of on- and off-bout
per day. Mean times are shown in those time units you specify the argument \emph{sampling.rate}.
}
\description{
Calculation of number and duration of incubation
 on- and off-bouts.
}
\examples{
#' # loading example data
data(incR_procdata)
incRbouts (data=incR_procdata, 
           vector.incubation="incR_score", 
           dec_time="dec_time",
           temp="temperature",
           sampling.rate=240) # sampling rate in seconds.
}
\seealso{
\code{\link{incRprep}} \code{\link{incRscan}} \code{\link{incRact}}
\code{\link{incRatt}}
}
\author{
Pablo Capilla-Lasheras
}
