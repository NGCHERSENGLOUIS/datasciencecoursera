complete <- function(directory, id=1:332){
    files <- list.files()
    output_data <- data.frame("id"=numeric(),"nobs"=numeric())
    for(i in id){
        nobs <- 0
        idno <- i
        excel <- read.csv(paste(directory, files[i], sep="/"))
        for(y in 1:nrow(excel)){
            if(!is.na(excel[y,2]) & !is.na(excel[y,3])){
                nobs <- nobs + 1
            }
        }
        adder <- data.frame("id" = idno, "nobs" = nobs)
        output_data <- rbind(output_data, adder)
    }
    output_data
}