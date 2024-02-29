library(tidyverse)
library(knitr)
library(readr)
library(tibble)
library(dplyr)
library(gapminder)

#data load in
data <- read.csv("wqd.csv")

##Added unique identifier to records
data$record.id <- seq.int(nrow(data))

##Removed Unwanted Variables, Created new data frame
dataclean = data |>
  select(-Unit_Id,-Air.Temp...F.,-DateVerified,-WhoVerified,-AirTemp..C.,-Year)

##Renamed Desired Variables
dataclean = dataclean |>
  rename(
    site.id = Site_Id,
    read.date = Read_Date,
    time = Time..24.00.,
    volunteer.name = Field_Tech,
    water.depth = Water.Depth..m.,
    water.transparency = Secchi.Depth..m.,
    water.temp = Water.Temp...C. ,
    air.temp = Air.Temp.Celsius,
    ph = pH..standard.units.,
    salinity = Salinity..ppt.,
    oxygen = Dissolved.Oxygen..mg.L.

##Reordered Remaining Variables
dataclean = dataclean |>
  relocate(any_of(c("record.id","site.id", "read.date", "time", "volunteer.name", "water.depth",
                    "water.temp", "air.temp", "water.transparency","ph", "salinity", "oxygen")))

##Cleaned up bad inputs in site.id
dataclean <- dataclean |> 
  mutate(site.id = case_when(
    site.id %in% c("d") ~ "D"
    ,TRUE ~ site.id))

dataclean <- dataclean |> 
  mutate(site.id = case_when(
    site.id %in% c("") ~ "Not Recorded",
    TRUE ~ site.id))

##Cleaned up bad inputs in read.date
dataclean <- dataclean |> 
  mutate(read.date = case_when(
    read.date %in% c("") ~ "Not Recorded"
    ,TRUE ~ read.date))

##Cleaned up bad inputs in time
dataclean <- dataclean |> 
  mutate(time = case_when(
    time %in% c("") ~ "Not Recorded"
    ,TRUE ~ time))

##Cleaned up bad inputs in volunteer.name
dataclean <- dataclean |> 
  mutate(volunteer.name = case_when(
    volunteer.name %in% c("") ~ "Not Recorded"
    ,TRUE ~ volunteer.name))

dataclean <- dataclean |> 
  mutate(volunteer.name = case_when(
    volunteer.name %in% c("Sue POE") ~ "Sue Poe"
    ,TRUE ~ volunteer.name))

dataclean <- dataclean |> 
  mutate(volunteer.name = case_when(
    volunteer.name %in% c("S. Poe") ~ "Sue Poe"
    ,TRUE ~ volunteer.name))

dataclean <- dataclean |> 
  mutate(volunteer.name = case_when(
    volunteer.name %in% c("Sue poe") ~ "Sue Poe"
    ,TRUE ~ volunteer.name))

dataclean <- dataclean |> 
  mutate(volunteer.name = case_when(
    volunteer.name %in% c("sue Poe") ~ "Sue Poe"
    ,TRUE ~ volunteer.name))

dataclean <- dataclean |> 
  mutate(volunteer.name = case_when(
    volunteer.name %in% c("Sue Poe") ~ "Susan Poe"
    ,TRUE ~ volunteer.name))

dataclean <- dataclean |> 
  mutate(volunteer.name = case_when(
    volunteer.name %in% c("Feldman") ~ "Mary Feldman"
    ,TRUE ~ volunteer.name))

##Summary data for factor variables
count(dataclean,volunteer.name)
count(dataclean,site.id)

##Summary of data for numerical variables
summary(dataclean,water.depth, na.rm = TRUE)
summary(dataclean,water.temp, na.rm = TRUE)
summary(dataclean,air.temp, na.rm = TRUE)
summary(dataclean,water.transparency, na.rm = TRUE)
summary(dataclean,ph, na.rm = TRUE)
summary(dataclean,salinity, na.rm = TRUE)
summary(dataclean,oxygen, na.rm = TRUE)
write.csv(dataclean, "clean_data.csv")

##Counted values of 0 in numerical as legitimate data, did not replace with N/A

