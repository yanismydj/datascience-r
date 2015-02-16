pollutantmean <- function(directory, pollutant, id = 1:332) {
  first_file = TRUE
  for (file_id in id) {
    new_data = read.csv(paste(directory, '/', sprintf("%03.0f", file_id), '.csv', sep = ''))
    if (first_file) {
      file_data <- new_data
      first_file = FALSE
    } else {
      file_data <- rbind(file_data, new_data)
    }
  }
  
  data_stripped = file_data[complete.cases(file_data),]
  mean(data_stripped[[pollutant]])
}