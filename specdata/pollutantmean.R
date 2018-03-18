pollutantmean <- function(directory, pollutant, id = 1:332){
    total <- head(read.csv(paste(directory, '/001.csv', sep="/")),0)
    files <- list.files(path = directory)
    for(i in id){
        excelfile <- read.csv(paste(directory, files[i], sep="/"), header = TRUE)
        total <- rbind(total, excelfile)
    }

    pt <- total[pollutant]
    bad <- is.na(pt)
    lv <- pt[!bad]
    mean(lv)
}

