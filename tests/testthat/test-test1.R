
url1 <- paste0("https://climate.weather.gc.ca/climate_data/",
              "bulk_data_e.html?format=csv&stationID=51097&",
              "timeframe=1&submit=Download%2BData&Year=2020&Month=10")

url2 <- paste0("http://climate.weather.gc.ca/climate_data/",
              "bulk_data_e.html?format=csv&stationID=51097&",
              "timeframe=1&submit=Download%2BData&Year=2020&Month=10")

test_that("https handshake", {
  expect_silent(utils::read.csv(url1)) %>%
    expect_is("data.frame")
})


test_that("http handshake", {
  expect_silent(utils::read.csv(url2)) %>%
    expect_is("data.frame")
})

test_that("httr GET https", {
  expect_silent(r <- httr::GET(url1))
  expect_silent(t <- httr::content(r, "text", encoding = "UTF-8"))
  expect_silent(read.csv(text = t)) %>%
    expect_is("data.frame")
})

test_that("httr GET http", {
  expect_silent(r <- httr::GET(url2))
  expect_silent(t <- httr::content(r, "text", encoding = "UTF-8"))
  expect_silent(read.csv(text = t)) %>%
    expect_is("data.frame")
})


test_that("curl https", {
  expect_silent(r <- curl::curl(url1, open = "r"))
  expect_silent(readLines(r))
})

test_that("curl http", {
  expect_silent(r <- curl::curl(url2, open = "r"))
  expect_silent(readLines(r))
})

test_that("download.file - auto", {
  expect_silent(download.file(url2, destfile = "temp.csv"))
  unlink("temp.csv")
})

test_that("download.file - auto", {
  expect_silent(download.file(url2, destfile = "temp.csv"))
  unlink("temp.csv")
})

test_that("download.file - wininet", {
  expect_silent(download.file(url2, destfile = "temp.csv", method = "wininet"))
  unlink("temp.csv")
})

test_that("download.file - libcurl", {
  expect_silent(download.file(url2, destfile = "temp.csv", method = "libcurl"))
  unlink("temp.csv")
})
