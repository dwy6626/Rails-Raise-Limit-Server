class Rack::Attack
  throttle('req/ip', limit: 60, period: 1.minutes) do |req|
    req.ip
  end
end
