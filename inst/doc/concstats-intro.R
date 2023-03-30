## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE,
                      comment = "#>",
                      fig.align = "center",
                      warning = FALSE,
                      screenshot.force = FALSE)

## ---- message=FALSE, warning=FALSE--------------------------------------------
library(concstats)

## -----------------------------------------------------------------------------
data("creditcoops")
head(creditcoops)

## ----example-1----------------------------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04, 0, 0)
test_share_top5 <- concstats_top5(test_share) # top 5 market share in percentage
test_share_top5

## ----example-2----------------------------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04, 0, 0)
test_share_top <- concstats_mstruct(test_share, type = "top") # top market share
test_share_top

## ----examples-mstruct-all-----------------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04, 0, 0)
test_share_mstruct <- concstats_mstruct(test_share, type = "all", digits = 3)
test_share_mstruct

## ----examples-entropy, echo=TRUE----------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04)
test_share_entropy <- concstats_entropy(test_share)
test_share_entropy

# and as a non-normalized value
test_share_entropy2 <- concstats_entropy(test_share, normalized = FALSE)
test_share_entropy2

## ----examples-hhi, echo=TRUE--------------------------------------------------
test_share <- c(0.35, 0.4, 0.05, 0.1, 0.06, 0.04, 0, 0)
test_share_hhi <- concstats_hhi(test_share)
test_share_hhi

# a normalized value
test_share_hhi2 <- concstats_hhi(test_share, normalized = TRUE)
test_share_hhi2

# the min average of the hhi
test_share_hhi3 <- concstats_comp(test_share, type = "hhi_min")
test_share_hhi3

## ----examples-concstats, echo=TRUE--------------------------------------------
test_share <- c(0.2, 0.3, 0.5)
test_share_conc <- concstats_concstats(test_share, digit = 2)
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
#  coops_2016 <- coops_2016[["total_loans"]] # atomic vector of total loans
#  coops_2016 <- coops_2016 / sum(coops_2016)  # market shares in decimal form
#  
#  # We then use the new object `coops_2016` to calculate the market structure
#  # measures as a group in a one-step-procedure and capture the results in a
#  # printed table:
#  coops_2016_mstruct <- concstats_mstruct(coops_2016, type = "all", digits = 2)
#  coops_2016_mstruct_tab <- coops_2016_mstruct %>%
#    kableExtra::kbl(caption = "Market structure 2016", digits = 2,
#                    booktabs = TRUE, align = "r") %>%
#    kableExtra::kable_classic(full_width = FALSE, html_font = "Arial")
#  coops_2016_mstruct_tab
#  

## ----visualization-sample-prep, echo=FALSE, eval=FALSE------------------------
#  df_shares <- creditcoops %>%
#    dplyr::select(coop_id, year, paired, total_loans_log)
#  

## ---- echo=TRUE, eval=FALSE---------------------------------------------------
#  library(ggplot2) # Data Visualizations Using the Grammar of Graphics
#  
#  df_shares_plot <- df_shares %>%
#    ggplot(aes(year, total_loans_log, fill = year)) +
#    geom_boxplot() +
#    geom_point() +
#    geom_line(aes(group = paired)) +
#    labs(title = "Credit cooperatives (type A)", y = "Total loans (log)",
#         caption = "Source: Andreas Schneider with data from INCOOP") +
#    theme(legend.position = "none")
#  df_shares_plot

