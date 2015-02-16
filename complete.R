complete <- function(directory, id = 1:332) {
  first_file = TRUE
  for (file_id in id) {
    file_data = read.csv(paste(directory, '/', sprintf("%03.0f", file_id), '.csv', sep = ''))
    if (first_file) {
      nobs <- nrow(file_data[complete.cases(file_data),])
      output = data.frame(id = file_id, nobs = nobs)
      first_file = FALSE
    } else {
      nobs <- nrow(file_data[complete.cases(file_data),])
      output <- rbind(output, data.frame(id = file_id, nobs = nobs))
    }
  }
  output
}