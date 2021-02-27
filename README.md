# Raise Limit Server

Rate limit server that serve 60 requests per minute per IP address.

Implement with [Rack::Attack](https://github.com/rack/rack-attack)

Return status 409 if request meets the threshold

## Setup

- Ruby 2.7.2
- run `bundle install` to install gems and node modules

## Test

```
rspec
```

see details in `spec/requests/home_request_spec.rb`

## Start the Server

```
rails s
```

It will serve on `127.0.0.1:3000` by default.

Only response to home page (`127.0.0.1:3000`) and return `ok` (if not limited).

## Time Spent

around 1 hr 30 min (including surveying)
