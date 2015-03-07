
myplot <- function(df, x) {
  names(df) <- c("x", "n")
  ggplot(df, aes(x=x, y=n)) + geom_point(size = 100)
}

categoricals <- eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from income"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_mc44693', PASS='orcl_mc44693', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'True'), verbose = TRUE), 1, 2^31-1)))
ddf <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from income"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_mc44693', PASS='orcl_mc44693', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

l <- list()
for (i in names(ddf)){
  if (i %in% categoricals[[1]]) {
    r <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select \\\""i"\\\", count(*) n from INCOME group by \\\""i"\\\" "'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_mc44693', PASS='orcl_mc44693', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON',i=i), verbose = TRUE)))
    p <- myplot(r,i)
    l[[i]] <- p
  }
}


#png("../00 Doc/categoricals.png", width = 25, height = 10, units = "in", res = 72)
#grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 8)))   
print(l[[2]], vp = viewport(layout.pos.row = 1, layout.pos.col = 1:4))
print(l[[3]], vp = viewport(layout.pos.row = 1, layout.pos.col = 5:8))

dev.off()

myplot1 <- function(df, x) {
  names(df) <- c("x")
  ggplot(df, aes(x=x)) + geom_histogram()
}

l <- list()
for (i in names(ddf)) {   
  # For details on [[...]] below, see http://stackoverflow.com/questions/1169456/in-r-what-is-the-difference-between-the-and-notations-for-accessing-the
  if (i %in% categoricals[[2]]) {
    r <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select \\\""i"\\\" from INCOME where \\\""i"\\\" is not null and mod(STCOU,1000)!=0 "'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_mc44693', PASS='orcl_mc44693', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON',i=i), verbose = TRUE)))
    p <- myplot1(r,i)
    l[[i]] <- p
  }
}

#png("../00 Doc/noncategoricals.png", width = 25, height = 10, units = "in", res = 72)
#grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 10)))   

print(l[[1]], vp = viewport(layout.pos.row = 1, layout.pos.col = 1:2))
print(l[[2]], vp = viewport(layout.pos.row = 1, layout.pos.col = 3:4))
print(l[[3]], vp = viewport(layout.pos.row = 1, layout.pos.col = 5:6))
print(l[[4]], vp = viewport(layout.pos.row = 1, layout.pos.col = 7:8))
print(l[[5]], vp = viewport(layout.pos.row = 1, layout.pos.col = 9:10))

print(l[[6]], vp = viewport(layout.pos.row = 2, layout.pos.col = 1:2))
print(l[[7]], vp = viewport(layout.pos.row = 2, layout.pos.col = 3:4))
print(l[[8]], vp = viewport(layout.pos.row = 2, layout.pos.col = 5:6))
print(l[[9]], vp = viewport(layout.pos.row = 2, layout.pos.col = 7:8))
print(l[[10]], vp = viewport(layout.pos.row = 2, layout.pos.col = 9:10))

dev.off()
