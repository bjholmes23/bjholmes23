publish_to_blake_holmes <- function(){
  library(rmarkdown)
  rstudio_path<-"~/Desktop/Professional/Blake-CV/resume-master/docs/"
  export_path<-paste0("/var/lib/tomcat9/webapps/ROOT/")
  export_path_date<-paste0(export_path, format(Sys.time(), '%d_%B_%Y'),"-")
  rmarkdown::render(paste0(rstudio_path, "index.Rmd"))

  system("echo placing Resume on webserver")
  system(paste0("cp ", rstudio_path,"index.html ", export_path, "index.html"))
  system(paste0("cp ", rstudio_path,"index.html ", export_path_date, "index.html"))

  system("echo placing Resume PDF on webserver")
  rmarkdown::render(paste0(rstudio_path,"index.Rmd"), params = list(is_pdf = TRUE)) %>%
    pagedown::chrome_print()
  system(paste0("cp ", rstudio_path,"index.pdf ", export_path, "HolmesB-resume.pdf"))
}

publish_to_blake_holmes()
