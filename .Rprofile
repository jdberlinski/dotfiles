library(utils)

options(repos=structure(c(CRAN="https://cran.rstudio.com/")), digits = 6,
        show.signif.starts = FALSE, prompt = "R > ", continue = "+   ")

.env = new.env()

.env$qq = function(save = "no") q(save = save)

.env$ht = function(d, n = 6) rbind(head(d, n), tail(d, n))
.env$hh = function(d) d[1:5, 1:5]
.env$gs = function(f = "~/Rplots.pdf") ggplot2::ggsave(f)
.env$pl = function(..., f = "~/Rplots.pdf") {
  pdf(f)
  plot(...)
  dev.off()
}

attach(.env)
