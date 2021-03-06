######################################
# R codes to assist Trial Design Coordinators
######################################

# /*=================================================*/
#' # Preparation
# /*=================================================*/
#/*----------------------------------*/
#' ## Load packages and source functions
#/*----------------------------------*/
source(
  "https://github.com/tmieno2/DIFM/blob/master/Functions/prepare.R?raw=TRUE",
  local = TRUE
)

# /*----------------------------------*/
#' ## Load the field parameter data
# /*----------------------------------*/
field_data <- jsonlite::fromJSON(
  file.path(
    here("Data", "CommonData"),
    "field_parameter_example.json"
  ),
  flatten = TRUE
) %>%
  data.table() %>%
  .[, field_year := paste(farm, field, year, sep = "_")]

#/*=================================================*/
#' # Create new field parameter entries  
#/*=================================================*/
#--- create an field parameter entry for a farm-field-year ---#
initiate_fp_entry(
  farm = "DodsonAg",
  field = "Windmill",
  year = 2021,
  json_file = "field_parameter_example.json"
)

#--- create data request folders ---#
make_td_folders(field_data)

#--- create grower data folders ---#
# (final destination of the raw datasets collected from the participating
# farmers)  
make_grower_folders(field_data)

#--- add inputs data (as the details of the trial gets clear) ---#
add_inputs(
  json_file = "field_parameter_example.json",
  farm = "DodsonAg",
  field = "Windmill",
  year = "2021",
  input_ls = c("urea", "N_equiv"),
  strategy_ls = c("trial", "base")
)


