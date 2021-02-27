# Raise Limit Server

Rate limit server that serve 60 requests per minute per IP address.
Error will be returned if the quantity of the requests meets the threshold.

## Setup

- Ruby 2.7.2
- run `bundle install` to install gems and node modules

## Test

```
rspec
```

## Start the Server

```
rails s
```
