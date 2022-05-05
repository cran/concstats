## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE,
                      comment = "#>",
                      fig.align = "center",
                      warning = FALSE,
                      screenshot.force = FALSE)

## ---- message=FALSE, warning=FALSE, results = "hide", eval=FALSE--------------
#  library(devtools) # Tools to Make Developing R Packages Easier
#  devtools::install_github("schneiderpy/concstats")

## ---- message=FALSE, warning=FALSE--------------------------------------------
library(concstats)

## -----------------------------------------------------------------------------
data("creditcoops")
head(creditcoops)

## ----example-1----------------------------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04, 0, 0)
test_share_top5 <- top5(test_share) # top 5 market share
test_share_top5

## ----example-2----------------------------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04, 0, 0)
test_share_top <- mstruct(test_share, type = "top") # top market share
test_share_top

## ----examples-mstruct-all-----------------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04, 0, 0)
test_share_mstruct <- mstruct(test_share, type = "all")
test_share_mstruct

## ----examples-entropy, echo=TRUE----------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04)
test_share_entropy <- entropy(test_share)
test_share_entropy

# and as a standardized value
test_share_entropy2 <- entropy(test_share, unbiased = TRUE)
test_share_entropy2

## ----examples-hhi, echo=TRUE--------------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04, 0, 0)
test_share_hhi <- hhi(test_share)
test_share_hhi

# a standardized value
test_share_hhi2 <- hhi(test_share, unbiased = TRUE)
test_share_hhi2

# the min average of the hhi
test_share_hhi3 <- comp(test_share, unbiased = TRUE, type = "hhi_min")
test_share_hhi3

## ----examples-concstats, echo=TRUE--------------------------------------------
test_share <- c(0.2, 0.3, 0.5)
test_share_conc <- concstats(test_share)
test_share_conc

## -----------------------------------------------------------------------------
data("creditcoops")
head(creditcoops)

## ----visualization-prep, message=FALSE, eval=FALSE----------------------------
#  library(dplyr)
#  library(kableExtra)

## ----visualization-tab, echo=TRUE, eval=FALSE---------------------------------
#  coops_2016 <- creditcoops %>% dplyr::filter(year == 2016)
#  head(coops_2016)
#  
#  coops_2016 <-  coops_2016[["total_loans"]] # atomic vector of total loans
#  coops_2016 <- coops_2016/sum(coops_2016)   # convert the vector in decimal form
#                                             # of market shares
#  
#  # We then use the new object `coops_2016` to calculate the market structure measures
#  # as a group in a one-step-procedure:
#  coops_2016_mstruct <- mstruct(coops_2016, type = "all")
#  coops_2016_mstruct_tab <- coops_2016_mstruct %>%
#    kableExtra::kbl(caption = "Market structure 2016", digits = 2,
#                    booktabs = T, align = "r") %>%
#    kableExtra::kable_classic(full_width = F, html_font = "Arial")
#  coops_2016_mstruct_tab
#  

## ---- echo=FALSE--------------------------------------------------------------
knitr::include_graphics("mstruct_tab.png")

## ----visualization-sample-prep, echo=FALSE, eval=FALSE------------------------
#  df_shares <- creditcoops %>% dplyr::select(coop_id, year, paired, total_loans_log)

## -----------------------------------------------------------------------------
library(ggplot2) # Create Elegant Data Visualizations Using the Grammar of Graphics

