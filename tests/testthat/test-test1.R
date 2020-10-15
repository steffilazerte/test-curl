test_that("https handshake", {
  expect_silent(utils::read.csv(paste0("https://climate.weather.gc.ca/climate_data/",
                                      "bulk_data_e.html?format=csv&stationID=51097&",
                                      "timeframe=1&submit=Download%2BData&Year=2020&Month=10"))) %>%
    expect_is("data.frame")
})


test_that("http handshake", {
  expect_silent(utils::read.csv(paste0("http://climate.weather.gc.ca/climate_data/",
                                       "bulk_data_e.html?format=csv&stationID=51097&",
                                       "timeframe=1&submit=Download%2BData&Year=2020&Month=10"))) %>%
    expect_is("data.frame")
})
