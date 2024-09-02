library(data.table)
library(curl)
# Load file
url <- "https://raw.githubusercontent.com/jinseob2kim/lecture-snuhlab/master/data/example_g1e.csv"
### df <- read.table(url,header=T)
dt <- fread(url,header=T)
# Class
print(class(dt))

fwrite(dt,"example_g1e.csv")    ##파일 저장  
head(dt)
## row operation
dt[c(1,3,5)]
dt[BMI>= 30 & HGHT <=150]        ##조건 검색

## column operation
dt[,c(1,3,5)]                   #열을 순번으로 지정 가능능
dt[,.(HGHT,WGHT)]
dt[,.(height=HGHT, weight=WGHT)]

bars<- c("HGHT","WGHT")         ##..변수로 열을 고를 수 있다.
  dt[,..bars]                   ## -/!로 빼고 고를 수 있다.
  rm(bars)
  
bars<- c("HGHT","WGHT")
  dt[,bars,with=F]
  rm(bars)

bars<- c("HGHT","WGHT")
  dt[, .SD, .SDcols = bars]
  rm(bars)
  


# lapply w/ .SD
ex<-data.table(
  group=c("a","a","b","b"), HGHT= c(180, 175, 165, 170), WGHT=c(75, 70, 65, 80)
)
ex
bars=c("HGHT","WGHT")
ex[, lapply(.SD, mean), by = group, .SDcols = bars];rm(bars)
ex[, lapply(.SD, mean), by = group, .SDcols = c("HGHT","WGHT")]
rm(ex)

#
