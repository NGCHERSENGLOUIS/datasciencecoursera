corr <- function(directory, threshold = 0){
    files <- list.files()
    final <- vector()#data.frame("correlation" = numeric())
    for(t in 1:332){
        if(complete(directory, t)[2] > threshold){
            output <- data.frame("sulfate"=numeric(),"nitrate"=numeric())
            excel <- read.csv(paste(directory, files[t], sep="/"))
            for(y in  1:nrow(excel)){
                if(!is.na(excel[y,2]) & !is.na(excel[y,3])){
                    insert <- data.frame("sulfate"=excel[y,2], "nitrate"=excel[y,3])
                    output <- rbind(output, insert)
                }
            }
            final <- c(final, cor(output[1], output[2]))
        }
    }
    final
}