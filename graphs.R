library(dplyr)
library(ggplot2)
library(tidyverse)

httpgd::hgd()
httpgd::hgd_browse()

backendData = as.data.frame(read.csv("backend_summary.csv"))
backendDataLocal = as.data.frame(read.csv("backend_summary_local.csv"))
frontendData = as.data.frame(read.csv("frontend_summary.csv"))
frontendDataLocal = as.data.frame(read.csv("frontend_summary_local.csv"))

min(backendData$timeStamp)


length_of_interval = 1000

createGraph = function(data, title){
    data = data %>%
        mutate(interval = floor((timeStamp - min(timeStamp)) / length_of_interval) + 1) %>%
        group_by(interval, label) %>%
        summarise(elapsed = mean(elapsed))

    ggplot(data, aes(x = interval, y = elapsed, group = label, color = label)) +
        geom_line() +
        labs(x = "Second", y = "Elapsed (ms)", title = title) +
        theme_bw() +
        theme(plot.title = element_text(hjust = 0.5))
}



#print(createGraph(backendDataLocal, "Backend (Local)"))
#print(createGraph(backendData, "Backend (Remote)"))
print(createGraph(frontendDataLocal, "Frontend (Local)"))
#print(createGraph(frontendData, "Frontend (Remote)"))
