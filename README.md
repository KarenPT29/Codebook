# Codebook

This Codebook is an assignment for a Data Analysis Course taken at American University School of International Service. 

Overview of Data:
From 1989-2019, monitors with the U.S. Fish and Wildlife Service took samples at Back Bay National Wildlife Refuge in Virginia Beach, VA, to ensure water quality standards were being met. They were concerned that allowing water quality parameters to “remain at undesirable levels for a prolonged time frame will result in mortalities to aquatic vegetation and organisms”. 

Sources and Methodology:
The government department responsible, recruited volunteers to assist in this monitoring. For twenty years, volunteers diligently collected water samples once every two weeks at several points in the bay and in holding ponds connected to it. That collection of data points can be found at https://ecos.fws.gov/ServCat/Reference/Profile/117348 .

Note on Missing Values:
This information, being gathered by volunteers, contained missing values due to poor inputs. Function and character variables (site.id and volunteer.name, read.date and time, respectively) have been marked with “Not Recorded” in instances of a blank entry. Missing numerical variable information (all others) are marked by N/A.

The edits I made to the original data is as follows: 
1. Added unique identifier to records for ease of reading.
2. Removed unwanted variables and created a new data frame.
3. Renamed desired variables for ease of contextual understanding and reordered the variables 
4. Cleaned up bad data in volunteer names to include not recorded in lieu of blanks in original data. 
5. Cleaned up data in time to include N/A for blanks
6. Counted values of 0 in numerical as legitimate data, did not replace with N/A for salinity as I am not an expert on the topic. 