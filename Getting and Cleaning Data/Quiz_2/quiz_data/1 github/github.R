#install.packages("httr")
library(httr)

#install.packages("jsonlite")
library(jsonlite)

#install.packages("httpuv")
library(httpuv)


# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/

oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "7410ab95f294460841db",
                   secret = "3d18c34473885bb1b8bc88570375f1955411868e")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
# get the repo weblink: https://api.github.com/users/jtleek/repos using token
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

stop_for_status(req)

# Authentication complete. Please close this page and return to R.

# Extract content from a request
json1 <- content(req)

# Convert to a data.frame
df = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Find "datasharing"
df$name

#What time "datasharing" was it created ?

df$created_at[24]
