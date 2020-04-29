library(colorout)
library(utils)

options(repos=structure(c(CRAN="https://cran.rstudio.com/")), digits = 6,
        show.signif.stars = FALSE, prompt = "R > ", continue = "    ")

# update.packages(ask = FALSE)

.env = new.env()

.env$qq = function(save = "no") q(save = save)

.env$ht = function(d, n = 6) rbind(head(d, n), tail(d, n))
.env$hh = function(d) d[1:5, 1:5]

attach(.env)
